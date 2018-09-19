//
//  ZYClassListView.swift
//  CreatClassDemo
//
//  Created by bestsu on 2018/9/17.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit

class ZYClassListView: UIView, UICollectionViewDataSource, UICollectionViewDelegate{

    var finishCreatBtnViewCallBack:(()->())?

    var exitClassNum: Int = 0
    var listViewSelectCellCallBack: ((Int)->())?
    
//    var choseClassName: [String]?{
//        didSet{
//            let currentNum = (choseClassName?.count ?? 0) - exitClassNum
//            let remainNum: Int = 5 - currentNum - exitClassNum
//            self.changeLabelColor(choseNum: currentNum, classNumbs: "(您还可创建\(remainNum)个班级)")
//            self.collectionView.reloadData()
//            if (choseClassName?.count ?? 0) > 0{
//                self.finishCreatBtnView.isSelected = true
//            }else{
//                self.finishCreatBtnView.isSelected = false
//            }
//        }
//    }
    //    /// 外部传入，内部删除使用
    var listArr: [ChoseClassStruct]?{
        didSet{
            self.classListViewClassNameArr.removeAll()
            for value in listArr!{
                getAddClassStringWithChoseClassArr(choseClass: value)
//                self.collectionView.reloadData()
            }
        }
    }
    /// 通过结构体数组中的元素 拿到班级字符串
    var classListViewClassNameArr: [String] = [String]()
    private func getAddClassStringWithChoseClassArr(choseClass: ChoseClassStruct){
        let gradeArr: String = getStrWithGrade(grade: choseClass.grade)
        let classNum: String = "\(choseClass.classNumber)班"
        let className: String = "\(gradeArr)" + "\(classNum)"
        classListViewClassNameArr.append(className)
        
        let currentNum = (classListViewClassNameArr.count) - exitClassNum
        let remainNum: Int = 5 - currentNum - exitClassNum
        self.changeLabelColor(choseNum: currentNum, classNumbs: "(您还可创建\(remainNum)个班级)")
        self.collectionView.reloadData()
        if (classListViewClassNameArr.count - exitClassNum) > 0{
            self.finishCreatBtnView.isSelected = true
        }else{
            self.finishCreatBtnView.isSelected = false
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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setUI(){
        addSubview(choseClassLabel)
        addSubview(listBgView)
        addSubview(collectionView)
        addSubview(finishCreatBtnView)
        
        choseClassLabel.mas_makeConstraints { (make) in
            make?.left.equalTo()(ceilStandardPtf(60))
            make?.top.equalTo()(ceilStandardPtf(36))
        }
        
        listBgView.mas_makeConstraints { (make) in
            make?.left.equalTo()(ceilStandardPtf(60))
            make?.top.mas_equalTo()(choseClassLabel.mas_bottom)?.setOffset(ceilStandardPtf(70))
            make?.right.equalTo()(ceilStandardPtf(-60))
            make?.bottom.mas_equalTo()(self)
        }
        
        collectionView.mas_makeConstraints { (make) in
            make?.left.equalTo()(ceilStandardPtf(60))
            make?.top.mas_equalTo()(choseClassLabel.mas_bottom)?.setOffset(ceilStandardPtf(70))
            make?.right.equalTo()(ceilStandardPtf(-60))
            make?.bottom.mas_equalTo()(self)
        }
        
        finishCreatBtnView.mas_makeConstraints { (make) in
            make?.left.bottom().right().mas_equalTo()(self)
            make?.height.equalTo()(ceilStandardPtf(171))
        }

    }
    
    //    MARK: 改变label字体颜色的方法
    private func changeLabelColor(choseNum: Int, classNumbs: String){
        self.choseClassLabel.text = "已选择\(choseNum)个班级\(classNumbs)"
        let ranStr = "\(classNumbs)"
        let attrstring:NSMutableAttributedString = NSMutableAttributedString(string:self.choseClassLabel.text!)
        let str = NSString(string: self.choseClassLabel.text!)
        let theRange = str.range(of: ranStr)
        attrstring.addAttribute(NSForegroundColorAttributeName, value: UIColor.init(hex: 0x101010, alpha: 0.35), range: theRange)
        attrstring.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: ceilStandardPtf(39)), range: theRange)
        self.choseClassLabel.attributedText = attrstring
    }

    //  MARK:  collectionview的代理方法和数据源方法
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return classListViewClassNameArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ZYCreatClassListCollectionViewCell
        cell.className = classListViewClassNameArr[indexPath.row]
        if listArr?[indexPath.row].status == 2{
            cell.isSelect = false
        }else{
            cell.isSelect = true
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        listViewSelectCellCallBack?(indexPath.row)
    }
    
    /// 完成创建按钮点击
    @objc private func finishCreatBtnViewClick(){
        finishCreatBtnViewCallBack?()
    }
    
    //  MARK:  懒加载控件
    private lazy var choseClassLabel: UILabel = {
        let label = UILabel()
        label.text = "已选择1个班级(您还可创建4个班级)"
        label.textAlignment = .center
        label.textColor = UIColor.init(hex: 0x222222, alpha: 0.65)
        label.font = UIFont.systemFont(ofSize: ceilStandardPtf(39))
        return label
    }()

   private lazy var collectionView:UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout.init()
        flowlayout.itemSize = CGSize(width: ceilStandardPtf(276), height: ceilStandardPtf(96))
        flowlayout.minimumInteritemSpacing = ceilStandardPtf(60)
        flowlayout.minimumLineSpacing = ceilStandardPtf(40)
        let view = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowlayout)
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = UIColor.clear
        view.isScrollEnabled = false
        view.register(ZYCreatClassListCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cellId")
        return view
    }()
 
    private lazy var finishCreatBtnView: ZYBest_ButtonView = {
        let view = ZYBest_ButtonView()
//        view.isSelected = true
        view.titleName = "完成创建"
        view.setImage(image: UIImage.init(named: "button copy"), for: .normal)
        view.setImage(image: UIImage.init(named: "button"), for: .selected)
        view.addTarget(self, action: #selector(finishCreatBtnViewClick), for: .touchUpInside)
        return view
    }()
    
    /// 提供展示的view
    private lazy var listBgView: ZYClassListViewBgView = {
        let view = ZYClassListViewBgView()
        return view
    }()
}




