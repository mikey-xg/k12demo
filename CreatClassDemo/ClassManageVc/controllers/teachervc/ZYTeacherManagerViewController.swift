//
//  ZYTeacherManagerViewController.swift
//  CreatClassDemo
//
//  Created by bestsu on 2018/9/14.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit

enum DeleteAlertStyle: String{
    //// 删除学生
    case deleteStudent
    /// 删除带有学生的班级
    case deleteClassNoneStudent
    /// 删除没有学生的班级
    case deleteClassExitStudent
    /// 班级删除成功
    case classDeleteSuccess
    /// 学生删除成功
    case studentDeleteSuccess
}

class ZYTeacherManagerViewController: UIViewController, UITableViewDataSource{

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }
/// 两种状态，如果有学生的时候展示学生列表即使用setUI方法，没有学生时使用 提示页面
    convenience init(isExitStudent: Bool){
        self.init()
        setItem()
        if isExitStudent == false{
            setNoneStudentUI()
        }else{
            setUI()
        }
    }
    
    private func setItem(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "   三年级2班", imageName: "channelClose", titleColor: UIColor.init(hex6: 0x222222), font: UIFont.systemFont(ofSize: ceilStandardPtf(51)), target: self, action: #selector(leftClick))
    }
    
    private func setNoneStudentUI(){
        view.addSubview(noneClassView)
        view.addSubview(deleteClassBtn)
        view.addSubview(inviteBtn)
        
        noneClassView.mas_makeConstraints { (make) in
            make?.edges.mas_equalTo()(view)
        }
        
        deleteClassBtn.mas_makeConstraints { (make) in
            make?.centerX.mas_equalTo()(view)
            make?.bottom.equalTo()(ceilStandardPtf(-120))
            make?.size.mas_equalTo()(CGSize(width: ceilStandardPtf(840), height: ceilStandardPtf(135)))
        }
        
        inviteBtn.mas_makeConstraints { (make) in
            make?.centerX.mas_equalTo()(view)
            make?.bottom.mas_equalTo()(deleteClassBtn.mas_top)?.setOffset(ceilStandardPtf(-90))
            make?.size.mas_equalTo()(deleteClassBtn)
        }
        
    }
    
    private func setUI(){
        view.addSubview(inviteCodeLabel)
        view.addSubview(inviteStudentBtn)
        view.addSubview(colorView)
        view.addSubview(classNumLabel)
        view.addSubview(tableView)
        view.addSubview(deleteClassBtnView)
        
        inviteCodeLabel.mas_makeConstraints { (make) in
            make?.top.equalTo()(ceilStandardPtf(100))
            make?.left.equalTo()(ceilStandardPtf(60))
        }
        
        inviteStudentBtn.mas_makeConstraints { (make) in
            make?.centerY.mas_equalTo()(inviteCodeLabel)
            make?.right.equalTo()(ceilStandardPtf(-60))
            make?.size.mas_equalTo()(CGSize(width: ceilStandardPtf(252), height: ceilStandardPtf(96)))
        }
        
        colorView.mas_makeConstraints { (make) in
            make?.top.mas_equalTo()(inviteStudentBtn.mas_bottom)?.setOffset(ceilStandardPtf(72))
            make?.left.right().equalTo()(0)
            make?.height.equalTo()(ceilStandardPtf(24))
        }
        
        classNumLabel.mas_makeConstraints { (make) in
            make?.top.mas_equalTo()(colorView.mas_bottom)?.setOffset(ceilStandardPtf(60))
            make?.left.equalTo()(ceilStandardPtf(60))
        }
        
        tableView.mas_makeConstraints { (make) in
            make?.top.mas_equalTo()(classNumLabel.mas_bottom)?.setOffset(ceilStandardPtf(20))
            make?.left.right().mas_equalTo()(self.view)
            make?.bottom.equalTo()(ceilStandardPtf(-171))
        }
        
        deleteClassBtnView.mas_makeConstraints { (make) in
            make?.left.bottom().right().mas_equalTo()(view)
            make?.height.equalTo()(ceilStandardPtf(171))
        }
        
    }
    
    //  MARK:  tableview的数据源方法
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! ZYTeacherManagerStudentListTableViewCell
        cell.tag = indexPath.row
        
        cell.deleteBtnCallBack = {[weak self] (index) in
            self?.deleteStudentBtnCallBack(index: index)
        }
        return cell
    }
    
    /// 删除 Alert弹窗
    var deleteStuedntName: String = "小黑"
    private func setAlert(style: DeleteAlertStyle){
        var title = ""
        if style == .deleteStudent{
            title = "确认要删除该学生吗？"
        }else if style == .deleteClassNoneStudent{
            title = "请确认是否要删除该班级?"
        }else if style == .deleteClassExitStudent{
            title = "该班级已有学生加入,\n请确认是否要删除该班级?"
        }else if style == .classDeleteSuccess{
            title = "删除成功"
        }else if style == .studentDeleteSuccess{
            title = "已将\"\(deleteStuedntName)\"从班级中删除"
        }
        if style == .deleteStudent || style ==  .deleteClassNoneStudent || style == .deleteClassExitStudent{
            let deepAlert2 = UIAlertController(title: title, message: "", preferredStyle: .alert)
            let thinkAction = UIAlertAction(title: "再想想", style: .default, handler: nil)
            let yesAction = UIAlertAction(title: "删除", style: .default, handler: { (action:UIAlertAction) in
                print("删除了....类型是：", style)
            })
            deepAlert2.addAction(yesAction)
            deepAlert2.addAction(thinkAction)
            self.present(deepAlert2, animated: true, completion: nil)
        }else{
            let deepAlert2 = UIAlertController(title: title, message: "", preferredStyle: .alert)
            let thinkAction = UIAlertAction(title: "我知道了", style: .default, handler: nil)
            deepAlert2.addAction(thinkAction)
            self.present(deepAlert2, animated: true, completion: nil)
        }
    }

    // 点击删除的处理方法
    private func deleteStudentBtnCallBack(index: Int){
        print("点击删除的是第：\(index)个")
        setAlert(style: .deleteStudent)
    }
    
    @objc private func leftClick(){
        self.navigationController?.popViewController(animated: true)
    }
    //    删除班级按钮点击
    @objc private func deleteClassBtnViewClick(){
        print("删除班级")
        /// 这里需要判断班级里面是否有学生存在，如果有学生为 deleteClassExitStudent 类型
        setAlert(style: .studentDeleteSuccess)
    }
    //    邀请学生按钮点击
    @objc private func inviteStudentBtnClick(){
        print("邀请学生按钮点击")
        let vc = ZYTeacherInviteJoinClassViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //  MARK: - 当 为false的时候的邀请学生按钮点击
    @objc private func inviteBtnClick(){
        print("邀请学生按钮点击")
        let vc = ZYTeacherInviteJoinClassViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    //  没有学生的时候点击  删除班级按钮点击
    @objc private func deleteClassBtnClick(){
        // 这个类型不用改了，就是没有学生删除班级的操作
        setAlert(style: .deleteClassNoneStudent)
    }
    //  MARK:  -  懒加载控件
    private lazy var deleteClassBtnView: ZYBest_ButtonView = {
        let view = ZYBest_ButtonView()
        view.isSelected = true
        view.titleName = "删除班级"
        view.setImage(image: UIImage.init(named: "button copy"), for: .normal)
        view.setImage(image: UIImage.init(named: "button"), for: .selected)
        view.addTarget(self, action: #selector(deleteClassBtnViewClick), for: .touchUpInside)
        return view
    }()
    
    private lazy var inviteCodeLabel: UILabel = {
        let label = UILabel()
        label.text = "邀请码：345621"
        label.textAlignment = .left
        label.textColor = UIColor.init(hex: 0x2BC17C)
        label.font = UIFont.boldSystemFont(ofSize: ceilStandardPtf(48))
        return label
    }()
    
    private lazy var inviteStudentBtn: UIButton = {
        let button = UIButton()
        button.adjustsImageWhenHighlighted = false
        button.layer.cornerRadius = ceilStandardPtf(12)
        button.layer.masksToBounds = true
        button.layer.borderColor = UIColor.init(hex: 0x2BC17C).cgColor
        button.layer.borderWidth = ceilStandardPtf(3)
        button.setTitle("邀请学生", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: ceilStandardPtf(42))
        button.setTitleColor(UIColor.init(hex: 0x2BC17C), for: .normal)
        button.addTarget(self, action: #selector(inviteStudentBtnClick), for: .touchUpInside)
        return button
    }()
    
    private lazy var colorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex6: 0xf5f5f5)
        return view
    }()
    
    private lazy var classNumLabel: UILabel = {
        let label = UILabel()
        label.text = "班级人数:20人"
        label.textAlignment = .left
        label.textColor = UIColor.init(hex6: 0x222222)
        label.font = UIFont.boldSystemFont(ofSize: ceilStandardPtf(48))
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: CGRect.zero, style: .plain)
        view.dataSource = self
        view.rowHeight = ceilStandardPtf(204)
        view.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: ceilStandardPtf(20), right: 0)
        view.register(ZYTeacherManagerStudentListTableViewCell.classForCoder(), forCellReuseIdentifier: "cellId")
        return view
    }()
    
    
    //  MARK: - noneStudent控件懒加载
    private lazy var noneClassView: ZYStudentNoneClassView = {
        let view = ZYStudentNoneClassView()
        view.infoLabel.text = "该班级还没有学生，可邀请学生加入"
        return view
    }()
    
    private lazy var inviteBtn: UIButton = {
        let button = UIButton()
        button.adjustsImageWhenHighlighted = false
        button.layer.cornerRadius = ceilStandardPtf(12)
        button.layer.masksToBounds = true
        button.setBackgroundImage(UIImage.imageWithColor(UIColor.init(hex: 0x22d695)), for: .normal)
        button.setTitle("邀请学生", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: ceilStandardPtf(48))
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(inviteBtnClick), for: .touchUpInside)
        return button
    }()
    
    private lazy var deleteClassBtn: UIButton = {
        let button = UIButton()
        button.adjustsImageWhenHighlighted = false
        button.layer.cornerRadius = ceilStandardPtf(12)
        button.layer.masksToBounds = true
        button.layer.borderColor = UIColor.init(hex: 0x2BC17C).cgColor
        button.layer.borderWidth = ceilStandardPtf(3)
        button.setTitle("删除班级", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: ceilStandardPtf(48))
        button.setTitleColor(UIColor.init(hex: 0x2BC17C), for: .normal)
        button.addTarget(self, action: #selector(deleteClassBtnClick), for: .touchUpInside)
        return button
    }()
    
}



