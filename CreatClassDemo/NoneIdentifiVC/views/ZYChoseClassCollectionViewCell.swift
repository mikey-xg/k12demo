//
//  ZYChoseClassCollectionViewCell.swift
//  CreatClassDemo
//
//  Created by bestsu on 2018/9/13.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit

class ZYChoseClassCollectionViewCell: UICollectionViewCell {
    
    var className: String?{
        didSet{
            self.classCell.className = className
        }
    }
    
    var isClick: Bool? {
        didSet{
            self.classCell.isSelected = isClick ?? false
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(){
        self.contentView.addSubview(classCell)
        
        classCell.mas_makeConstraints { (make) in
            make?.edges.mas_equalTo()(self.contentView)
        }
        
    }
    
    
    private lazy var classCell: ZYChoseClassControl = {
        let view = ZYChoseClassControl()
        return view
    }()
}
