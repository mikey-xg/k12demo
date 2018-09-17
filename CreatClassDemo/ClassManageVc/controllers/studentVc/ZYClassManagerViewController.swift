//
//  ZYClassManagerViewController.swift
//  CreatClassDemo
//
//  Created by bestsu on 2018/9/14.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit

class ZYClassManagerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setBarItem()
        setUI()
    }
    
    private func setBarItem(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "   班级管理", imageName: "channelClose", titleColor: UIColor.init(hex6: 0x222222), font: UIFont.systemFont(ofSize: ceilStandardPtf(51)), target: self, action: #selector(leftClick))
    }

    @objc private func leftClick(){
        self.navigationController?.popViewController(animated: true)
    }

    private func setUI(){
        
        view.addSubview(noneClassView)
        view.addSubview(tableView)
        view.addSubview(joinClassBtnView)
        
        noneClassView.mas_makeConstraints { (make) in
            make?.edges.mas_equalTo()(view)
        }
        
        tableView.mas_makeConstraints { (make) in
            make?.left.right().top().mas_equalTo()(view)
            make?.bottom.equalTo()(ceilStandardPtf(-181))
        }
        
        joinClassBtnView.mas_makeConstraints { (make) in
            make?.left.bottom().right().mas_equalTo()(view)
            make?.height.equalTo()(ceilStandardPtf(171))
        }

    }
    
    // 设置view的状态
    private func setViewStatus(isExit: Bool){
        if isExit == true{
            self.tableView.isHidden = false
            self.joinClassBtnView.titleName = "加入更多班级"
        }else{
            self.tableView.isHidden = true
            self.joinClassBtnView.titleName = "加入班级"
        }
    }
    
    //  MARK:  - tableview的代理方法
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! ZYStuentClassManagerTableViewCell
        cell.tag = indexPath.row
        cell.exitClassBtnCallBack = {[weak self] (index) in
            self?.exitClassFunc(index: index)
        }
        return cell
    }
    
    //  MARK: - 退出班级按钮点击方法
    private func exitClassFunc(index: Int){
        print("点击了第\(index)个cell")
    }
    
    //  MARK:  - 加入更过班级按钮点击
    @objc private func joinClassBtnViewClick(){
        print("加入更多班级")
        let vc = ZYStudentJoinClassViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: CGRect.zero, style: .plain)
        view.delegate = self
        view.dataSource = self
//        view.isHidden = true
        view.separatorStyle = .none
        view.rowHeight = ceilStandardPtf(390)
        view.backgroundColor = UIColor.init(hex6: 0xf5f5f5)
        view.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        view.register(ZYStuentClassManagerTableViewCell.classForCoder(), forCellReuseIdentifier: "cellId")
        return view
    }()
    
    private lazy var joinClassBtnView: ZYBest_ButtonView = {
        let view = ZYBest_ButtonView()
        view.isSelected = true
        view.titleName = "加入班级"
        view.setImage(image: UIImage.init(named: "button copy"), for: .normal)
        view.setImage(image: UIImage.init(named: "button"), for: .selected)
        view.addTarget(self, action: #selector(joinClassBtnViewClick), for: .touchUpInside)
        return view
    }()
    
    private lazy var noneClassView: ZYStudentNoneClassView = {
        let view = ZYStudentNoneClassView()
        return view
    }()
    
}
