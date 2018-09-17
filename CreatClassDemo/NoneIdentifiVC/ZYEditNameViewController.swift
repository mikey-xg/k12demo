//
//  ZYEditNameViewController.swift
//  CreatClassDemo
//
//  Created by bestsu on 2018/9/13.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit
///  这个控制器需要接口逻辑(这里在上一步进行判断学生的姓名字段， 如果没有就跳转，如果有就跳到下一个页面)
class ZYEditNameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        setBarItem()
        setUI()
    }
    
    private func setBarItem(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "   填写姓名", imageName: "channelClose", titleColor: UIColor.init(hex6: 0x222222), font: UIFont.systemFont(ofSize: ceilStandardPtf(51)), target: self, action: #selector(leftClick))
    }
    
   
    
    private func setUI(){
        view.addSubview(infoLabel)
        view.addSubview(lineView)
        view.addSubview(textField)
        view.addSubview(shadowView)
        view.addSubview(finishBtn)
        
        infoLabel.mas_makeConstraints { (make) in
            make?.centerX.mas_equalTo()(self.view)
            make?.top.equalTo()(ceilStandardPtf(303))
        }
        
        lineView.mas_makeConstraints { (make) in
            make?.centerX.mas_equalTo()(view)
            make?.top.mas_equalTo()(infoLabel.mas_bottom)?.setOffset(ceilStandardPtf(180))
            make?.height.equalTo()(ceilStandardPtf(2))
            make?.width.equalTo()(ceilStandardPtf(900))
        }
        
        textField.mas_makeConstraints { (make) in
            make?.bottom.mas_equalTo()(lineView)
            make?.left.right().mas_equalTo()(lineView)
            make?.height.equalTo()(ceilStandardPtf(120))
        }
        
        shadowView.mas_makeConstraints { (make) in
            make?.left.bottom().right().mas_equalTo()(view)
            make?.height.equalTo()(ceilStandardPtf(171))
        }
        
        finishBtn.mas_makeConstraints { (make) in
            make?.centerX.mas_equalTo()(self.view)
            make?.bottom.equalTo()(ceilStandardPtf(-18))
            make?.size.mas_equalTo()(CGSize(width: ceilStandardPtf(840), height: ceilStandardPtf(135)))
        }
        
    }
    
    // 返回按钮点击
    @objc private func leftClick(){
        self.navigationController?.popViewController(animated: true)
    }
    
    // textfield的输入点击
    @objc private func textFieldClick(){
        finishBtn.isSelected = (self.textField.text?.count ?? 0) > 0 ? true : false
    }
    
    /// 完成按钮点击
    @objc private func finishBtnClick(){
        if finishBtn.isSelected == false { return }
        print("姓名：", textField.text ?? "")
        let vc = ZYChoseClassViewController(isNoneExitIdentity: true)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "姓名（填写真实姓名方便老师找到你哦）"
        label.textAlignment = .center
        label.textColor = UIColor.init(hex: 0x222222, alpha: 0.35)
        label.font = UIFont.systemFont(ofSize: fontStandardPtf(48))
        return label
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: 0x222222, alpha: 0.20)
        return view
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.adjustsFontSizeToFitWidth=true
        textField.font = UIFont.systemFont(ofSize: ceilStandardPtf(48))
        textField.addTarget(self, action: #selector(textFieldClick), for: .editingChanged)
        return textField
    }()
    
    private lazy var finishBtn: UIButton = {
        let button = UIButton()
        button.adjustsImageWhenHighlighted = false
        button.isSelected = false
        button.setTitle("完成", for: .normal)
        button.setBackgroundImage(UIImage.init(named: "button copy"), for: .normal)
        button.setBackgroundImage(UIImage.init(named: "button"), for: .selected)
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontStandardPtf(48))
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(finishBtnClick), for: .touchUpInside)
        return button
    }()
    
    private lazy var shadowView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowRadius = 5
        view.layer.shadowOffset = CGSize(width: 0, height: -2)
        return view
    }()
    
}







