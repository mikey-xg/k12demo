//
//  ZYJoinClassFinishViewController.swift
//  CreatClassDemo
//
//  Created by bestsu on 2018/9/13.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit

class ZYJoinClassFinishViewController: UIViewController {

    var isNoneIdentity: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setItem()
        setUI()
    }

    convenience init(isNoneIdentity: Bool){
        self.init()
        self.isNoneIdentity = isNoneIdentity
        if isNoneIdentity == true{
            self.openBtn.setTitle("打开APP", for: .normal)
        }else{
            self.openBtn.setTitle("进入班级", for: .normal)
        }
    }
    
    private func setItem(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "   成功加入班级", imageName: "channelClose", titleColor: UIColor.init(hex6: 0x222222), font: UIFont.systemFont(ofSize: ceilStandardPtf(51)), target: self, action: #selector(leftClick))
    }

    private func setUI(){
        view.addSubview(shadowView)
        view.addSubview(openBtn)
        view.addSubview(finishImageView)
        view.addSubview(infoLabel)
    
        shadowView.mas_makeConstraints { (make) in
            make?.left.bottom().right().mas_equalTo()(view)
            make?.height.equalTo()(ceilStandardPtf(171))
        }
        
        openBtn.mas_makeConstraints { (make) in
            make?.centerX.mas_equalTo()(self.view)
            make?.bottom.equalTo()(ceilStandardPtf(-18))
            make?.size.mas_equalTo()(CGSize(width: ceilStandardPtf(840), height: ceilStandardPtf(135)))
        }
        
        finishImageView.mas_makeConstraints { (make) in
            make?.centerX.mas_equalTo()(view)
            make?.top.equalTo()(ceilStandardPtf(276))
            make?.size.mas_equalTo()(CGSize(width: ceilStandardPtf(291), height: ceilStandardPtf(291)))
        }
        
        infoLabel.mas_makeConstraints { (make) in
            make?.centerX.mas_equalTo()(view)
            make?.top.mas_equalTo()(finishImageView.mas_bottom)?.setOffset(ceilStandardPtf(88))
        }
    }
    
    @objc private func leftClick(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func openBtnClick(){
        if isNoneIdentity == true{
            print("跳转到首页Tabbar")
        }else{
            print("进入班级")
        }
    }
    
    //  MARK: - 懒加载控件
    private lazy var finishImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(named: "image_recharge_success")
        return view
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "你已经成功加入班级~"
        label.textAlignment = .center
        label.textColor = UIColor.init(hex6: 0x2BC17C)
        label.font = UIFont.boldSystemFont(ofSize: fontStandardPtf(48))
        return label
    }()
    
    private lazy var openBtn: UIButton = {
        let button = UIButton()
        button.adjustsImageWhenHighlighted = false
        button.setTitle("打开APP", for: .normal)
        button.setBackgroundImage(UIImage.init(named: "button"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontStandardPtf(48))
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(openBtnClick), for: .touchUpInside)
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
