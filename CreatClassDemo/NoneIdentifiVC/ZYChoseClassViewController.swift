//
//  ZYChoseClassViewController.swift
//  CreatClassDemo
//
//  Created by bestsu on 2018/9/13.
//  Copyright © 2018年 bestsu. All rights reserved.

/*
 1、 这里需要判断班级是否为一个，如果是一个的话就默认选中！！！
 2、如果是一个班级的默认选中同时jionBtn的 isSeletct 设置成 true

 */

import UIKit

class ZYChoseClassViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{

    var isNoneIdentity: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setItem()
    }
    
    convenience init(isNoneExitIdentity: Bool){
        self.init()
        self.isNoneIdentity = true
        setUI() 
    }
    
    convenience init(isJoinClass: Bool){
        self.init()
        self.isNoneIdentity = false
        setUI()
    }
    
    private func setItem(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "   选择班级", imageName: "channelClose", titleColor: UIColor.init(hex6: 0x222222), font: UIFont.systemFont(ofSize: ceilStandardPtf(51)), target: self, action: #selector(leftClick))
    }
    
    private func setUI(){
        view.addSubview(titleLabel)
        view.addSubview(collectionview)
        view.addSubview(shadowView)
        view.addSubview(joinBtn)
        
        titleLabel.mas_makeConstraints { (make) in
            make?.centerX.mas_equalTo()(self.view)
            make?.top.equalTo()(ceilStandardPtf(230))
        }
        
        collectionview.mas_makeConstraints { (make) in
            make?.left.right().mas_equalTo()(self.view)
            make?.top.mas_equalTo()(titleLabel.mas_bottom)?.setOffset(ceilStandardPtf(90))
            make?.height.equalTo()(ceilStandardPtf(500))
        }
        
        shadowView.mas_makeConstraints { (make) in
            make?.left.bottom().right().mas_equalTo()(view)
            make?.height.equalTo()(ceilStandardPtf(171))
        }

        joinBtn.mas_makeConstraints { (make) in
            make?.centerX.mas_equalTo()(self.view)
            make?.bottom.equalTo()(ceilStandardPtf(-18))
            make?.size.mas_equalTo()(CGSize(width: ceilStandardPtf(840), height: ceilStandardPtf(135)))
        }
        
        
    }
    
    //  MARK: - collectionview的代理方法和数据源方法
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ZYChoseClassCollectionViewCell
        cell.className = ["一年级1班", "一年级2班", "一年级15班", "一年级17班", "一年级19班"][indexPath.row]
        // 这里需要判断班级是否为一个，如果是一个的话就默认选中！！！
        cell.isClick = selectClassArrs?[indexPath.row]
        return cell
    }
    
    var selectClassArrs: [Bool]?
    var selectIndex: Int = 0 //选中的是哪一个
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var selectClassArr: [Bool] = Array.init(repeating: false, count: 5)
        selectClassArr[indexPath.row] = true
        self.selectClassArrs = selectClassArr
        self.selectIndex = indexPath.row
        self.collectionview.reloadData()
        self.joinBtn.isSelected = true
    }
    
    @objc private func leftClick(){
        self.navigationController?.popViewController(animated: true)
    }

    @objc private func joinBtnClick(){
        print("选中的是：", self.selectIndex)
        let vc = ZYJoinClassFinishViewController(isNoneIdentity: isNoneIdentity)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "段老师的班级"
        label.textAlignment = .center
        label.textColor = UIColor.init(hex6: 0x2BC17C)
        label.font = UIFont.boldSystemFont(ofSize: fontStandardPtf(48))
        return label
    }()
    
    private lazy var collectionview: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: ceilStandardPtf(276), height: ceilStandardPtf(96))
        flowLayout.minimumLineSpacing = ceilStandardPtf(72)
        flowLayout.minimumInteritemSpacing = ceilStandardPtf(60)
        flowLayout.scrollDirection = UICollectionViewScrollDirection.vertical
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        view.backgroundColor = UIColor.white
        view.delegate = self
        view.dataSource = self
        view.showsHorizontalScrollIndicator = false
        view.contentInset = UIEdgeInsets(top: 0, left: ceilStandardPtf(60), bottom: 0, right: ceilStandardPtf(60))
        view.register(ZYChoseClassCollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        return view
    }()
    
    private lazy var joinBtn: UIButton = {
        let button = UIButton()
        button.adjustsImageWhenHighlighted = false
        button.isSelected = false
        button.setTitle("立即加入", for: .normal)
        button.setBackgroundImage(UIImage.init(named: "button copy"), for: .normal)
        button.setBackgroundImage(UIImage.init(named: "button"), for: .selected)
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontStandardPtf(48))
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(joinBtnClick), for: .touchUpInside)
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



