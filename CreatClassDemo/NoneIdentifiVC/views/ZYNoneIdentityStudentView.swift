//
//  ZYNoneIdentityStudentView.swift
//  CreatClassDemo
//
//  Created by bestsu on 2018/9/12.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit

class ZYNoneIdentityStudentView: UIView {

//  MARK: 确认按钮点击回调
    var confirmBtnCallBack: ((String)->())?
    ///邀请老师创建班级回调
    var inviteTeacherCreatClassCallBack: (()->())?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    /// 用于班级管理学生加入班级使用
    convenience init(ideityIsTrue: Bool){
        self.init()

        if ideityIsTrue == true{
            inviteTeacherBtn.isHidden = true
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(){
        addSubview(colorView)
        addSubview(studentLabel)
        addSubview(infoLabel)
        addSubview(confirmBtn)
        addSubview(textField)
        addSubview(lineView)
        addSubview(inviteTeacherBtn)
        
        colorView.mas_makeConstraints { (make) in
            make?.left.equalTo()(ceilStandardPtf(90))
            make?.top.equalTo()(ceilStandardPtf(24))
            make?.height.equalTo()(ceilStandardPtf(60))
            make?.width.equalTo()(ceilStandardPtf(15))
        }
        
        studentLabel.mas_makeConstraints { (make) in
            make?.centerY.mas_equalTo()(colorView)
            make?.left.mas_equalTo()(colorView.mas_right)?.setOffset(ceilStandardPtf(18))
        }
        
        infoLabel.mas_makeConstraints { (make) in
            make?.left.mas_equalTo()(colorView.mas_right)
            make?.top.mas_equalTo()(colorView.mas_bottom)?.setOffset(ceilStandardPtf(72))
        }
        
        confirmBtn.mas_makeConstraints { (make) in
            make?.top.mas_equalTo()(infoLabel.mas_bottom)?.setOffset(ceilStandardPtf(72))
            make?.right.equalTo()(ceilStandardPtf(-90))
            make?.size.mas_equalTo()(CGSize.init(width: ceilStandardPtf(168), height: ceilStandardPtf(90)))
        }

        textField.mas_makeConstraints { (make) in
            make?.left.equalTo()(ceilStandardPtf(145))
            make?.centerY.mas_equalTo()(confirmBtn)
            make?.right.mas_equalTo()(confirmBtn.mas_left)?.setOffset(ceilStandardPtf(-40))
        }
        
        lineView.mas_makeConstraints { (make) in
            make?.top.mas_equalTo()(confirmBtn.mas_bottom)?.setOffset(ceilStandardPtf(23))
            make?.centerX.mas_equalTo()(self)
            make?.height.equalTo()(ceilStandardPtf(2))
            make?.width.equalTo()(ceilStandardPtf(900))
        }
        
        inviteTeacherBtn.mas_makeConstraints { (make) in
            make?.left.mas_equalTo()(infoLabel)
            make?.top.mas_equalTo()(lineView.mas_bottom)?.setOffset(ceilStandardPtf(60))
            make?.size.mas_equalTo()(CGSize(width: ceilStandardPtf(358), height: ceilStandardPtf(39)))
        }
        
        
    }
    
    private func setFontSpace(){
        let dicArr = [NSKernAttributeName: NSNumber.init(value: Float(ceilStandardPtf(30)))]
        self.textField.attributedText = NSAttributedString.init(string: self.textField.text ?? "", attributes: dicArr)
    }
    
    /// 恢复 textField的初始状态
    func resetTextFieldStatus(){
        self.textField.text = ""
        textFieldClick()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textField.resignFirstResponder()
    }
    
    @objc private func inviteTeacherBtnClick(){
        inviteTeacherCreatClassCallBack?()
    }
    
    @objc private func textFieldClick(){
        setFontSpace()
        confirmBtn.isSelected = (self.textField.text?.count ?? 0) > 0 ? true : false
    }
    /// 确认按钮 点击方法
    @objc private func confirmBtnClick(){
        if confirmBtn.isSelected == false { print("条件不允许"); return}
        self.textField.resignFirstResponder()
        confirmBtnCallBack?(self.textField.text ?? "0")
    }
    
    //  MARK: 懒加载控件
    private lazy var colorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex6: 0x2BC17C)
        return view
    }()
    
    private lazy var studentLabel: UILabel = {
        let label = UILabel()
        label.text = "我是学生"
        label.textAlignment = .center
        label.textColor = UIColor.init(hex6: 0x222222)
        label.font = UIFont.boldSystemFont(ofSize: fontStandardPtf(60))
        return label
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "输入老师邀请码,参加免费阅读计划"
        label.textAlignment = .center
        label.textColor = UIColor.init(hex: 0x222222, alpha: 0.65)
        label.font = UIFont.systemFont(ofSize: fontStandardPtf(51))
        return label
    }()
    
    private lazy var confirmBtn: UIButton = {
        let button = UIButton()
        button.isSelected = false
        button.adjustsImageWhenHighlighted = false
        button.layer.cornerRadius = ceilStandardPtf(12)
        button.layer.masksToBounds = true
        button.setBackgroundImage(UIImage.imageWithColor(UIColor.init(hex6: 0x2BC17C)), for: .selected)
        button.setBackgroundImage(UIImage.imageWithColor(UIColor(hex: 0x222222, alpha: 0.15)), for: .normal)
        button.setTitle("确认", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: ceilStandardPtf(42))
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(confirmBtnClick), for: .touchUpInside)
        return button
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.keyboardType = .numberPad
        textField.adjustsFontSizeToFitWidth=true
        textField.font = UIFont.systemFont(ofSize: ceilStandardPtf(72))
        textField.addTarget(self, action: #selector(textFieldClick), for: .editingChanged)
        return textField
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex6: 0x2BC17C)
        return view
    }()

    private lazy var inviteTeacherBtn: UIButton = {
        let button = UIButton()
        button.adjustsImageWhenHighlighted = false
        button.setTitle("邀请老师,创建班级", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontStandardPtf(42))
        button.setTitleColor(UIColor.init(hex6: 0x08AAE6), for: .normal)
        button.addTarget(self, action: #selector(inviteTeacherBtnClick), for: .touchUpInside)
        return button
    }()

}
