//
//  ZYDisplayClassCollectionViewCell.swift
//  CreatClassDemo
//
//  Created by bestsu on 2018/9/17.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit

///// 选择班级状态 (临时使用，具体从接口拉取)
//enum CreatClassStyle: String {
//    /// 可以点击
//    case isClick
//    /// 已经点击
//    case isSelect
//    /// 不可选取
//    case noSelect
//}

class ZYDisplayClassCollectionViewCell: UICollectionViewCell {
    
    
    var className: String?{
        didSet{
            self.titleLabel.text = className
        }
    }
    var isSelect: Bool? {
        didSet{
            if isSelect == true{
                self.layer.borderColor = UIColor.init(hex: 0x2BC17C).cgColor
                self.titleLabel.textColor = UIColor.init(hex: 0x2BC17C)
            }else{
                self.layer.borderColor = UIColor.init(hex: 0x222222, alpha: 0.45).cgColor
                self.titleLabel.textColor = UIColor.init(hex: 0x222222, alpha: 0.45)
            }
        }
    }
//    var isSelectStyle: CreatClassStyle?{
//        didSet{
//            if isSelectStyle == .isClick{
//                self.layer.borderColor = UIColor.init(hex: 0x222222, alpha: 0.45).cgColor
//            }else if isSelectStyle == .isSelect{
//                self.layer.borderColor = UIColor.init(hex: 0x2BC17C).cgColor
//            }else{
//                self.layer.borderColor = UIColor.init(hex: 0x222222, alpha: 0.15).cgColor
//            }
//        }
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = ceilStandardPtf(12)
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.init(hex: 0x222222, alpha: 0.45).cgColor
        self.layer.borderWidth = ceilStandardPtf(3)
        self.backgroundColor = UIColor.white
        
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(){
        contentView.addSubview(titleLabel)
        
        titleLabel.mas_makeConstraints { (make) in
            make?.edges.mas_equalTo()(contentView)
        }
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "1班"
        label.textAlignment = .center
        label.textColor = UIColor.init(hex: 0x222222, alpha: 0.45)
        label.font = UIFont.systemFont(ofSize: ceilStandardPtf(42))
        return label
    }()
    
}




