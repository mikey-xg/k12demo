//
//  ZYStuentClassManagerTableViewCell.swift
//  CreatClassDemo
//
//  Created by bestsu on 2018/9/14.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit

class ZYStuentClassManagerTableViewCell: UITableViewCell {

    var exitClassBtnCallBack: ((Int)->())?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowRadius = 8
        self.layer.shadowOffset = CGSize(width: 4, height: ceilStandardPtf(45))
        
        self.selectionStyle = .none
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(){
        contentView.addSubview(bgImageView)
        contentView.addSubview(classNameLabel)
        contentView.addSubview(teacherNameLabel)
        contentView.addSubview(studentNumLabel)
        contentView.addSubview(exitClassBtn)
        
        bgImageView.mas_makeConstraints { (make) in
            make?.left.equalTo()(ceilStandardPtf(60))
            make?.right.equalTo()(ceilStandardPtf(-60))
            make?.bottom.equalTo()(0)
            make?.height.equalTo()(ceilStandardPtf(342))
        }
        
        classNameLabel.mas_makeConstraints { (make) in
            make?.left.equalTo()(ceilStandardPtf(126))
            make?.top.mas_equalTo()(bgImageView.mas_top)?.setOffset(ceilStandardPtf(60))
        }
        
        teacherNameLabel.mas_makeConstraints { (make) in
            make?.left.equalTo()(ceilStandardPtf(126))
            make?.top.mas_equalTo()(classNameLabel.mas_bottom)?.setOffset(ceilStandardPtf(84))
        }
        
        studentNumLabel.mas_makeConstraints { (make) in
            make?.right.equalTo()(ceilStandardPtf(-108))
            make?.centerY.mas_equalTo()(classNameLabel)
        }
        
        exitClassBtn.mas_makeConstraints { (make) in
            make?.right.equalTo()(ceilStandardPtf(-108))
            make?.centerY.mas_equalTo()(teacherNameLabel)
            make?.size.mas_equalTo()(CGSize(width: ceilStandardPtf(276), height: ceilStandardPtf(96)))
        }
        
    }
    
    @objc private func exitClassBtnClick(){
        exitClassBtnCallBack?(self.tag)
    }

    private lazy var bgImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(named: "joinOtherClass")
        return view
    }()
    
    private lazy var classNameLabel: UILabel = {
        let label = UILabel()
        label.text = "十年级20班"
        label.textAlignment = .center
        label.textColor = UIColor.init(hex6: 0x222222)
        label.font = UIFont.boldSystemFont(ofSize: ceilStandardPtf(66))
        return label
    }()
    
    private lazy var teacherNameLabel: UILabel = {
        let label = UILabel()
        label.text = "老师：蚂蚁蚂蚁"
        label.textAlignment = .center
        label.textColor = UIColor.init(hex: 0x222222, alpha: 0.65)
        label.font = UIFont.systemFont(ofSize: ceilStandardPtf(51))
        return label
    }()
    
    private lazy var studentNumLabel: UILabel = {
        let label = UILabel()
        label.text = "学生: 100人"
        label.textAlignment = .center
        label.textColor = UIColor.init(hex: 0x222222, alpha: 0.35)
        label.font = UIFont.systemFont(ofSize: ceilStandardPtf(51))
        return label
    }()
    
    private lazy var exitClassBtn: UIButton = {
        let button = UIButton()
        button.adjustsImageWhenHighlighted = false
        button.layer.cornerRadius = ceilStandardPtf(12)
        button.layer.masksToBounds = true
        button.layer.borderColor = UIColor.init(hex6: 0xff7652).cgColor
        button.layer.borderWidth = ceilStandardPtf(3)
        button.setTitle("退出班级", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: ceilStandardPtf(42))
        button.setTitleColor(UIColor.init(hex6: 0xFF7652), for: .normal)
        button.addTarget(self, action: #selector(exitClassBtnClick), for: .touchUpInside)
        return button
    }()
    
    
}






