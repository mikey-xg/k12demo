//
//  ZYStuedntJoinClassViewController.swift
//  CreatClassDemo
//
//  Created by bestsu on 2018/9/14.
//  Copyright © 2018年 bestsu. All rights reserved.
//ZYStudentJoinClassViewController.swift

import UIKit

class ZYStudentJoinClassViewController: UIViewController {

    var inviteCode: Int64 = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setItem()
        setUI()
    }

    private func setItem(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "   加入班级", imageName: "channelClose", titleColor: UIColor.init(hex6: 0x222222), font: UIFont.systemFont(ofSize: ceilStandardPtf(51)), target: self, action: #selector(leftClick))
    }
    
    @objc private func leftClick(){
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setUI(){
        view.addSubview(classView)
        
        classView.mas_makeConstraints { (make) in
            make?.edges.mas_equalTo()(view)
        }
        
        classView.confirmBtnCallBack = { [weak self] (code) in
            self?.inviteCode = Int64(code) ?? 0
            print("code：", self?.inviteCode ?? 0)
            let vc = ZYChoseClassViewController(isJoinClass: true)
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private lazy var classView: ZYNoneIdentityStudentView = {
        let view = ZYNoneIdentityStudentView(ideityIsTrue: true)
        return view
    }()

}
