//
//  ZYTeacherInviteJoinClassViewController.swift
//  CreatClassDemo
//
//  Created by bestsu on 2018/9/15.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit

class ZYTeacherInviteJoinClassViewController: UIViewController {

    var inviteCode: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setItem()
        setUI()
    }
    
    convenience init(inviteCode: Int){
        self.init()
        self.inviteCode = inviteCode
        
    }
    
    private func setItem(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "   邀请学生加入班级", imageName: "channelClose", titleColor: UIColor.init(hex6: 0x222222), font: UIFont.systemFont(ofSize: ceilStandardPtf(51)), target: self, action: #selector(leftClick))
    }
    
    
    private func setUI(){
        view.addSubview(iconImageView)
        view.addSubview(infoLabel)
        view.addSubview(leftLineView)
        view.addSubview(rightLineView)
        view.addSubview(weChatBtnView)
        view.addSubview(QQBtnView)
        
        view.addSubview(headImageView)
        view.addSubview(nameLabel)
        view.addSubview(inviteCodeLabel)
        
        iconImageView.mas_makeConstraints { (make) in
            make?.left.right().mas_equalTo()(view)
            make?.top.equalTo()(ceilStandardPtf(103))
            make?.height.equalTo()(ceilStandardPtf(960))
        }
        
        infoLabel.mas_makeConstraints { (make) in
            make?.centerX.mas_equalTo()(view)
            make?.top.mas_equalTo()(iconImageView.mas_bottom)?.setOffset(ceilStandardPtf(238))
        }
        
        leftLineView.mas_makeConstraints { (make) in
            make?.left.equalTo()(ceilStandardPtf(60))
            make?.right.mas_equalTo()(infoLabel.mas_left)?.setOffset(ceilStandardPtf(-20))
            make?.centerY.mas_equalTo()(infoLabel)
            make?.height.equalTo()(ceilStandardPtf(1))
        }
        
        rightLineView.mas_makeConstraints { (make) in
            make?.right.equalTo()(ceilStandardPtf(-60))
            make?.left.mas_equalTo()(infoLabel.mas_right)?.setOffset(ceilStandardPtf(20))
            make?.centerY.mas_equalTo()(infoLabel)
            make?.height.equalTo()(ceilStandardPtf(1))
        }
        
        weChatBtnView.mas_makeConstraints { (make) in
            make?.left.equalTo()(ceilStandardPtf(220))
            make?.top.mas_equalTo()(infoLabel.mas_bottom)?.setOffset(ceilStandardPtf(60))
            make?.size.mas_equalTo()(CGSize(width: ceilStandardPtf(160), height: ceilStandardPtf(292)))
        }
        
        QQBtnView.mas_makeConstraints { (make) in
            make?.right.equalTo()(ceilStandardPtf(-220))
            make?.top.mas_equalTo()(weChatBtnView)
            make?.size.mas_equalTo()(weChatBtnView)
        }
        
        headImageView.mas_makeConstraints { (make) in
            make?.top.mas_equalTo()(iconImageView.mas_top)?.setOffset(ceilStandardPtf(110))
            make?.left.mas_equalTo()(ceilStandardPtf(180))
            make?.size.mas_equalTo()(CGSize(width: ceilStandardPtf(180), height: ceilStandardPtf(180)))
        }
        
        nameLabel.mas_makeConstraints { (make) in
            make?.centerX.mas_equalTo()(headImageView)
            make?.top.mas_equalTo()(headImageView.mas_bottom)?.setOffset(ceilStandardPtf(48))
        }
        
        inviteCodeLabel.mas_makeConstraints { (make) in
            make?.centerX.mas_equalTo()(headImageView)
            make?.top.mas_equalTo()(nameLabel.mas_bottom)?.setOffset(ceilStandardPtf(120))
            make?.size.mas_equalTo()(CGSize(width: ceilStandardPtf(401), height: ceilStandardPtf(87)))
        }
        
    }
    
    @objc private func leftClick(){
        self.navigationController?.popViewController(animated: true)
    }
    
    //  MARK:  微信分享
    @objc private func weChatShareClick(){
        print("点击了微信分享")
    }
    
    //  MARK:  qq分享
    @objc private func qqShareClick(){
        print("点击了qq分享")
    }
    
    
    private lazy var iconImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(named: "Group 8")
        view.sizeToFit()
        return view
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "分享至"
        label.textAlignment = .center
        label.textColor = UIColor.init(hex: 0x222222, alpha: 0.35)
        label.font = UIFont.systemFont(ofSize: ceilStandardPtf(39))
        return label
    }()
    
    private lazy var leftLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: 0x222222, alpha: 0.25)
        return view
    }()
    
    private lazy var rightLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: 0x222222, alpha: 0.25)
        return view
    }()
    
    private lazy var weChatBtnView: ZYShareViewControl = {
        let view = ZYShareViewControl()
        view.titleName = "微信好友"
        view.image = UIImage.init(named: "weixin1")
        view.addTarget(self, action: #selector(weChatShareClick), for: .touchUpInside)
        return view
    }()
 
    private lazy var QQBtnView: ZYShareViewControl = {
        let view = ZYShareViewControl()
        view.titleName = "QQ好友"
        view.image = UIImage.init(named: "qq")
        view.addTarget(self, action: #selector(qqShareClick), for: .touchUpInside)
        return view
    }()
    
    private lazy var headImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = ceilStandardPtf(90)
        view.layer.masksToBounds = true
        view.image = UIImage.init(named: "laoshi")
        return view
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "大灰灰"
        label.textAlignment = .center
        label.textColor = UIColor.init(hex6: 0x222222)
        label.font = UIFont.boldSystemFont(ofSize: ceilStandardPtf(54))
        return label
    }()
    
    private lazy var inviteCodeLabel: UILabel = {
        let label = UILabel()
        label.text = "3445621"
        label.textAlignment = .center
        label.layer.cornerRadius = ceilStandardPtf(12)
        label.layer.masksToBounds = true
        label.layer.borderWidth = ceilStandardPtf(3)
        label.layer.borderColor = UIColor.init(hex: 0x222222, alpha: 0.65).cgColor
        label.textColor = UIColor.init(hex6: 0x222222)
        label.font = UIFont.boldSystemFont(ofSize: ceilStandardPtf(54))
        return label
    }()
}





