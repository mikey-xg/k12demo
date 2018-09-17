//
//  ZYNoneIdentityTeacherView.swift
//  CreatClassDemo
//
//  Created by bestsu on 2018/9/12.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit

class ZYNoneIdentityTeacherView: UIView {
    
/// 申请创建班级按钮点击 回调
    var creatClassBtnCallBack: (()->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(){
        addSubview(colorView)
        addSubview(teacherLabel)
        addSubview(creatClassBtn)
        
        colorView.mas_makeConstraints { (make) in
            make?.left.equalTo()(ceilStandardPtf(90))
            make?.top.mas_equalTo()(self)
            make?.height.equalTo()(ceilStandardPtf(60))
            make?.width.equalTo()(ceilStandardPtf(15))
        }
        
        teacherLabel.mas_makeConstraints { (make) in
            make?.centerY.mas_equalTo()(colorView)
            make?.left.mas_equalTo()(colorView.mas_right)?.setOffset(ceilStandardPtf(18))
        }
        
        creatClassBtn.mas_makeConstraints { (make) in
            make?.centerX.mas_equalTo()(self)
            make?.top.mas_equalTo()(colorView.mas_bottom)?.setOffset(ceilStandardPtf(120))
            make?.size.mas_equalTo()(CGSize.init(width: ceilStandardPtf(840), height: ceilStandardPtf(135)))
        }
    }
    
    ///  申请创建班级按钮点击
    @objc private func creatClassBtnClick(){
        creatClassBtnCallBack?()
    }
    
    //  MARK: 懒加载控件
    private lazy var colorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex6: 0xFF7652)
        return view
    }()
    
    private lazy var teacherLabel: UILabel = {
        let label = UILabel()
        label.text = "我是老师"
        label.textAlignment = .center
        label.textColor = UIColor.init(hex6: 0x222222)
        label.font = UIFont.boldSystemFont(ofSize: fontStandardPtf(60))
        return label
    }()
    
    private lazy var creatClassBtn: UIButton = {
        let button = UIButton()
        button.adjustsImageWhenHighlighted = false
        button.layer.cornerRadius = ceilStandardPtf(12)
        button.layer.masksToBounds = true
        button.layer.borderColor = UIColor.init(hex6: 0x2BC17C).cgColor
        button.layer.borderWidth = ceilStandardPtf(3)
        button.setTitle("申请创建班级", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: ceilStandardPtf(48))
        button.setTitleColor(UIColor.init(hex6: 0x2BC17C), for: .normal)
        button.addTarget(self, action: #selector(creatClassBtnClick), for: .touchUpInside)
        return button
    }()

}






