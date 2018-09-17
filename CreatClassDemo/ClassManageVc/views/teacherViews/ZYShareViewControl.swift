//
//  ZYShareViewControl.swift
//  CreatClassDemo
//
//  Created by bestsu on 2018/9/15.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit

class ZYShareViewControl: ZYBaseControl {
    
    var titleName: String? {
        didSet{
            self.titleLabel.text = titleName ?? ""
        }
    }
    var image: UIImage?{
        didSet{
            self.iconView.image = image
        }
    }
    
    override func setupUserInterface() {
        addSubview(iconView)
        addSubview(titleLabel)
        
        iconView.mas_makeConstraints { (make) in
            make?.top.mas_equalTo()(self)
            make?.centerX.mas_equalTo()(self)
            make?.width.equalTo()(ceilStandardPtf(144))
            make?.height.equalTo()(ceilStandardPtf(144))
        }
        
        titleLabel.mas_makeConstraints { (make) in
            make?.top.mas_equalTo()(iconView.mas_bottom)?.setOffset(ceilStandardPtf(48))
            make?.left.right().mas_equalTo()(self)
        }
    }
    
    private lazy var iconView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = ceilStandardPtf(72)
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.init(hex6: 0x222222)
        label.font = UIFont.systemFont(ofSize: ceilStandardPtf(36))
        label.textAlignment = .center
        return label
    }()

}
