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
//    /// 外部传入，内部删除使用
//    var listArr: [ChoseClassStruct]?
    
    var listViewSelectCellCallBack: ((Int)->())?
    
    var choseClassName: [String]?{
        didSet{
            let currentNum = choseClassName?.count ?? 0
            let remainNum: Int = 5 - currentNum
            self.changeLabelColor(choseNum: currentNum, classNumbs: "(您还可创建\(remainNum)个班级)")
            self.collectionView.reloadData()
            if (choseClassName?.count ?? 0) > 0{
                self.finishCreatBtnView.isSelected = true
            }else{
                self.finishCreatBtnView.isSelected = false
            }
        }
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
        return choseClassName?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ZYCreatClassListCollectionViewCell
        cell.className = choseClassName?[indexPath.row]
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




