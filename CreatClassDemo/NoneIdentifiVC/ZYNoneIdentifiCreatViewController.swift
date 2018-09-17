//
//  ZYNoneIdentifiCreatViewController.swift
//  CreatClassDemo
//
//  Created by bestsu on 2018/9/12.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit
///  无身份加入和创建
class ZYNoneIdentifiCreatViewController: ZYStatusBarViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.navigationItem.title = ""
        setBarItem()
        setUI()
        callBackFunc()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("出现了....")
        self.studentView.resetTextFieldStatus()
    }

    private func setBarItem(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "Group 3"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(rightClick))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(hex: 0x222222, alpha: 0.65)
    }
    
    private func setUI(){
        view.addSubview(teacherView)
        view.addSubview(studentView)
        
        teacherView.mas_makeConstraints { (make) in
            make?.left.bottom().right().mas_equalTo()(view)
            make?.height.equalTo()(ceilStandardPtf(705))
        }
        
        studentView.mas_makeConstraints { (make) in
            make?.left.top().right().mas_equalTo()(view)
            make?.bottom.mas_equalTo()(teacherView.mas_top)
        }
        
    }

    /// 回调 方法
    var inviteCode: Int64 = 0
    private func callBackFunc(){
//        MARK:  邀请码确认按钮点击
        studentView.confirmBtnCallBack = {[weak self] (code) in
            self?.inviteCode = Int64(code) ?? 0
            print("输入的邀请码为：", self?.inviteCode ?? 0)
            let vc = ZYEditNameViewController()
            vc.hidesBottomBarWhenPushed = true
            self?.navigationController?.pushViewController(vc, animated: true)
        }
//        MARK:  邀请老师创建班级点击
        studentView.inviteTeacherCreatClassCallBack = {[weak self] in
            print("邀请老师，创建班级",self?.studentView.subviews.count ?? 0)
        }
//        MARK:  申请创建班级按钮点击
        teacherView.creatClassBtnCallBack = { [weak self] in
            print("申请创建班级按钮点击",self?.teacherView.subviews.count ?? 0)
        }
    }

    @objc private func rightClick(){
        print("跳转H5")
    }
    
    private lazy var studentView: ZYNoneIdentityStudentView = {
        let view = ZYNoneIdentityStudentView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    private lazy var teacherView: ZYNoneIdentityTeacherView = {
        let view = ZYNoneIdentityTeacherView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
}







