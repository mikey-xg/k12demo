//
//  ZYCreatClassListCollectionViewCell.swift
//  CreatClassDemo
//
//  Created by bestsu on 2018/9/17.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit

class ZYCreatClassListCollectionViewCell: UICollectionViewCell {
    
    var isSelect: Bool?{
        didSet{
            if isSelect == true{
                self.titleLabel.layer.borderColor = UIColor.init(hex: 0x2BC17C).cgColor
                self.titleLabel.textColor = UIColor.init(hex: 0x2BC17C)
                
            }else{
                self.titleLabel.layer.borderColor = UIColor.init(hex: 0x222222, alpha: 0.15).cgColor
                self.titleLabel.textColor = UIColor.init(hex: 0x222222, alpha: 0.15)
            }
        }
    }
    
//    /// 是否要隐藏label
//    var isHiddenLabel: Bool?{
//        didSet{
//            self.titleLabel.isHidden = isHiddenLabel ?? true
//        }
//    }
    /// 年级名称
    var className: String?{
        didSet{
            self.titleLabel.text = className ?? ""
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.backgroundColor = UIColor.clear
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(){
//        contentView.addSubview(bgView)
        contentView.addSubview(titleLabel)
        
//        bgView.mas_makeConstraints { (make) in
//            make?.edges.mas_equalTo()(self.contentView)
//        }
        titleLabel.mas_makeConstraints { (make) in
            make?.edges.mas_equalTo()(contentView)
        }
        
        
    }
    
    private lazy var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = ceilStandardPtf(12)
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        label.layer.cornerRadius = ceilStandardPtf(12)
        label.layer.masksToBounds = true
        label.layer.borderColor = UIColor.init(hex: 0x2BC17C).cgColor
        label.layer.borderWidth = ceilStandardPtf(3)
        label.textAlignment = .center
        label.textColor = UIColor.init(hex: 0x2BC17C)
        label.font = UIFont.systemFont(ofSize: ceilStandardPtf(42))
        return label
    }()
    
//    private lazy var iconImageView: UIImageView = {
//        let view = UIImageView()
//        view.image = UIImage.init(named: "Rectangle19")
//        return view
//    }()
    
}
