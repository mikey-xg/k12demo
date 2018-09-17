//
//  ZYTeacherCreatClassView.swift
//  CreatClassDemo
//
//  Created by 苏文潇 on 2018/9/16.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit

/// 记录选中的 年级和班级
struct ChoseClassStruct {
    var grade:Int = 0
    var classNumber: Int = 0
}

class ZYTeacherCreatClassView: UIView, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate{

    
    //    MARK: 12个班级的Array,死数据，不要动
    var class1Array: [Bool] = [Bool].init(repeating: false, count: 20)
    var class2Array: [Bool] = [Bool].init(repeating: false, count: 20)
    var class3Array: [Bool] = [Bool].init(repeating: false, count: 20)
    var class4Array: [Bool] = [Bool].init(repeating: false, count: 20)
    var class5Array: [Bool] = [Bool].init(repeating: false, count: 20)
    var class6Array: [Bool] = [Bool].init(repeating: false, count: 20)
    var class7Array: [Bool] = [Bool].init(repeating: false, count: 20)
    var class8Array: [Bool] = [Bool].init(repeating: false, count: 20)
    var class9Array: [Bool] = [Bool].init(repeating: false, count: 20)
    var class10Array: [Bool] = [Bool].init(repeating: false, count: 20)
    var class11Array: [Bool] = [Bool].init(repeating: false, count: 20)
    var class12Array: [Bool] = [Bool].init(repeating: false, count: 20)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(){
        self.addSubview(classListView)
        self.addSubview(tableview)
//        self.addSubview(collectionView)
        self.insertSubview(collectionView, belowSubview: classListView)
        
        classListView.mas_makeConstraints { (make) in
            make?.left.right().bottom().mas_equalTo()(self)
            make?.height.equalTo()(ceilStandardPtf(650))
        }
        
        tableview.mas_makeConstraints { (make) in
            make?.left.top().mas_equalTo()(self)
            make?.bottom.mas_equalTo()(classListView.mas_top)
            make?.width.equalTo()(ceilStandardPtf(210))
        }
        
        collectionView.mas_makeConstraints { (make) in
            make?.top.right().bottom().mas_equalTo()(self)
            make?.left.mas_equalTo()(tableview.mas_right)
        }
    }

    //  MARK: - tableView的代理方法和数据源方法
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classNameArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! ZYCreatClassTableViewCell
        if clickArr == nil{
            if indexPath.row == 0{
                cell.isClick = true
            }else{
                cell.isClick = clickArr?[indexPath.row]
            }
        }else{
            cell.isClick = clickArr?[indexPath.row]
        }
        cell.className = classNameArr[indexPath.row]
        return cell
    }
    var classNameArr: [String] = ["一年级", "二年级", "三年级", "四年级", "五年级", "六年级", "七年级", "八年级", "九年级", "十年级", "十一年级", "十二年级"]
    var clickArr: [Bool]?
    /// 选中的是哪一个年级
    var choseWhichGrade: Int = 0
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectArr:[Bool] = Array.init(repeating: false, count: 12)
        selectArr[indexPath.row] = true
        choseWhichGrade = indexPath.row
        clickArr = selectArr
        currentClassArr = getClass(index: choseWhichGrade)
        self.tableview.reloadData()
        self.collectionView.reloadData()
    }
    
    
    //  MARK: - collectionView的代理方法和数据源方法
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ZYDisplayClassCollectionViewCell
        cell.isSelect = getClass(index: choseWhichGrade)[indexPath.row]
        cell.className = "\(indexPath.row+1)班"
        return cell
    }
    
    var currentClassArr: [Bool] = Array.init(repeating: false, count: 20)
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if choseClassArr.count < 5{
            print(choseClassArr.count)
            currentClassArr[indexPath.row] = !currentClassArr[indexPath.row]
            if currentClassArr[indexPath.row] == true{
                /// 注意: 这里 +1 的意思是为了同步方便，可以清楚展示 哪个年级 的 哪个班级
                self.addClass(grade: choseWhichGrade+1, index: indexPath.row+1)
            }else{
                print("取消选中操作")
                /// 注意: 这里 +1 的意思是为了同步方便，可以清楚展示 哪个年级 的 哪个班级
                self.minusClass(grade: choseWhichGrade+1, index: indexPath.row+1)
            }
        }else{
            if currentClassArr[indexPath.row] == true{
                currentClassArr[indexPath.row] = !currentClassArr[indexPath.row]
                /// 注意: 这里 +1 的意思是为了同步方便，可以清楚展示 哪个年级 的 哪个班级
                self.minusClass(grade: choseWhichGrade+1, index: indexPath.row+1)
            }
        }
        setClass(index: choseWhichGrade, classArr: currentClassArr)
        self.collectionView.reloadData()
    }
    
    /// 通过结构体数组中的元素 拿到班级字符串
    var classListViewClassNameArr: [String] = [String]()
    private func getAddClassStringWithCloseClassArr() -> [String]{
        let gradeArr: String = getStrWithGrade(grade: choseClassArr[0].grade)
        let classNum: String = "\(choseClassArr[0].classNumber)班"
        let className: String = "\(gradeArr)" + "\(classNum)"
        classListViewClassNameArr.insert(className, at: 0)
        return classListViewClassNameArr
    }
    
    /// 新增加班级
    var choseClassArr: [ChoseClassStruct] = [ChoseClassStruct]()
    private func addClass(grade: Int, index: Int){
        choseClassArr.insert(ChoseClassStruct.init(grade: grade, classNumber: index), at: 0)
        classListView.choseClassName = getAddClassStringWithCloseClassArr()
    }
    /// 删除增加的班级
    private func minusClass(grade: Int, index: Int){
        for (i, value) in choseClassArr.enumerated(){
            if value.grade == grade{
                if value.classNumber == index{
                    choseClassArr.remove(at: i)
                    classListViewClassNameArr.remove(at: i)
                }
            }
        }
        classListView.choseClassName = classListViewClassNameArr
    }
    
    //  MARK: - 获取班级的选中状态
    private func getClass(index: Int) -> [Bool]{
        let current: Int = index + 1
        switch current {
        case 1:
            return class1Array
        case 2:
            return class2Array
        case 3:
            return class3Array
        case 4:
            return class4Array
        case 5:
            return class5Array
        case 6:
            return class6Array
        case 7:
            return class7Array
        case 8:
            return class8Array
        case 9:
            return class9Array
        case 10:
            return class10Array
        case 11:
            return class11Array
        case 12:
            return class12Array
        default:
            break
        }
        return [Bool]()
    }
    /// 设置班级的选中状态
    private func setClass(index: Int, classArr: [Bool]){
        let current: Int = index + 1
        switch current {
        case 1:
            class1Array = classArr
        case 2:
            class2Array = classArr
        case 3:
            class3Array = classArr
        case 4:
            class4Array = classArr
        case 5:
            class5Array = classArr
        case 6:
            class6Array = classArr
        case 7:
            class7Array = classArr
        case 8:
            class8Array = classArr
        case 9:
            class9Array = classArr
        case 10:
            class10Array = classArr
        case 11:
            class11Array = classArr
        case 12:
            class12Array = classArr
        default:
            break
        }
    }
    
    /// 根据年级数字  拿到 年级字符串
    private func getStrWithGrade(grade: Int) -> String{
        switch grade {
        case 1:
            return "一年级"
        case 2:
            return "二年级"
        case 3:
            return "三年级"
        case 4:
            return "四年级"
        case 5:
            return "五年级"
        case 6:
            return "六年级"
        case 7:
            return "七年级"
        case 8:
            return "八年级"
        case 9:
            return "九年级"
        case 10:
            return "十年级"
        case 11:
            return "十一年级"
        case 12:
            return "十二年级"
        default:
            break
        }
        return ""
    }
    
    //    MARK: 控件
    private lazy var tableview: UITableView = {
        let view = UITableView(frame: CGRect.zero, style: .plain)
        view.dataSource = self
        view.delegate = self
        view.separatorStyle = .none
        view.rowHeight = ceilStandardPtf(210)
        view.estimatedRowHeight = 0
        view.estimatedSectionFooterHeight = 0
        view.estimatedSectionHeaderHeight = 0
        view.register(ZYCreatClassTableViewCell.classForCoder(), forCellReuseIdentifier: "cellId")
        return view
    }()
    
    private lazy var collectionView:UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout.init()
        flowlayout.itemSize = CGSize(width: ceilStandardPtf(210), height: ceilStandardPtf(96))
        flowlayout.minimumInteritemSpacing = ceilStandardPtf(60)
        flowlayout.minimumLineSpacing = ceilStandardPtf(54)
        let view = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowlayout)
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = UIColor.white
        view.isScrollEnabled = false
        view.contentInset = UIEdgeInsets(top: ceilStandardPtf(50), left: ceilStandardPtf(50), bottom: 0, right: ceilStandardPtf(50))
        view.register(ZYDisplayClassCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cellId")
        return view
    }()

    /// 班级列表 完成创建view
    private lazy var classListView: ZYClassListView = {
        let view = ZYClassListView()
        return view
    }()
    

}






