//
//  UIColorExtension.swift
//  koalareading
//
//  Created by smile on 2017/2/13.
//  Copyright © 2017年 koalareading. All rights reserved.
//

import UIKit

extension UIColor {

    convenience init(hex6: Int) {
        self.init(hex8: (Int64(hex6) << 8) + 0xFF)
    }
    
    convenience init(hex8: Int64) {
        var rgb = hex8
        
        let alpha = rgb & 0xFF
        rgb >>= 8
        
        let blue = rgb & 0xFF
        rgb >>= 8
        
        let green = rgb & 0xFF
        rgb >>= 8
        
        self.init(red: CGFloat(rgb) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(alpha) / 255.0)
    }
    
    
    convenience init(hex: Int, alpha: Double = 1) {
        guard hex >= 0 && hex <= 0xFFFFFF else {
            assert(false, "输入的颜色超出范围")
            self.init(red: 0, green: 0, blue: 0, alpha: 1)
            return
        }
        let r = (hex & 0xFF0000) >> 16
        let g = (hex & 0x00FF00) >> 8
        let b = hex & 0x0000FF
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(alpha))
    }
}


/// 根据颜色得到图片
extension UIImage {
    class func imageWithColor(_ color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
