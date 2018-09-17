//
//  ZYClassListViewBgView.swift
//  CreatClassDemo
//
//  Created by bestsu on 2018/9/17.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit
/// 存展示使用，没有什么卵用
class ZYClassListViewBgView: UIView, UICollectionViewDataSource{

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = false
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(){
        self.addSubview(collectionView)
        
        collectionView.mas_makeConstraints { (make) in
            make?.edges.mas_equalTo()(self)
        }
    }
    //  MARK:  collectionview的代理方法和数据源方法
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ZYListViewBgViewCollectionViewCell
        return cell
    }
    
    private lazy var collectionView:UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout.init()
        flowlayout.itemSize = CGSize(width: ceilStandardPtf(276), height: ceilStandardPtf(96))
        flowlayout.minimumInteritemSpacing = ceilStandardPtf(60)
        flowlayout.minimumLineSpacing = ceilStandardPtf(40)
        let view = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowlayout)
        view.dataSource = self
        view.backgroundColor = UIColor.white
        view.isScrollEnabled = false
        view.register(ZYListViewBgViewCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cellId")
        return view
    }()
    
}



class ZYListViewBgViewCollectionViewCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(){
        contentView.addSubview(iconImageView)
        
        iconImageView.mas_makeConstraints { (make) in
            make?.edges.mas_equalTo()(self.contentView)
        }
    }

    private lazy var iconImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(named: "Rectangle19")
        return view
    }()
}
