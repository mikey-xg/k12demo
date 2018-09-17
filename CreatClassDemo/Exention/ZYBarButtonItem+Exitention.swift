//
//  ZYBarButtonItem+Exitention.swift
//  CreatClassDemo
//
//  Created by bestsu on 2018/9/13.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit

extension UIBarButtonItem {

    convenience init(title: String, imageName: String, titleColor: UIColor,font: UIFont, target: Any?, action: Selector) {
        self.init()
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = font
        button.setImage(UIImage(named: imageName), for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)
//        button.frame = CGRect(x: 0, y: 0, width: ceilStandardPtf(54), height: ceilStandardPtf(54))
        self.customView = button
    }
    
}
