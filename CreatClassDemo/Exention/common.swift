//
//  common.swift
//  CreatClassDemo
//
//  Created by bestsu on 2018/9/12.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit

//let screenWidth = UIScreen.main.bounds.size.width
//let screenHeight = UIScreen.main.bounds.size.height

// MARK: 是否是Iphone
func isPhone() -> Bool{
    return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone
}

// MARK: 是否是pad
func isPad() -> Bool{
    return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
}


//MARK:  设置约束使用
private func _screenWidth() -> CGFloat{
    return min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.width)
}

private func designStandardScale() -> CGFloat{
    return isPhone() ? _screenWidth() / 1080.0 : _screenWidth() / 2160.0
}

func ceilStandardPtf(_ value: CGFloat) ->CGFloat {
    let scale = designStandardScale()
    let ce = ceilf(Float(scale * value))
    return CGFloat(ce)
}

//    MRAK 设置字体使用
func fontStandardPtf(_ fontSize: CGFloat) -> CGFloat{
    return fontSize * designStandardScale()
}


/*
 
 private func setItem(){
 self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "   选择班级", imageName: "channelClose", titleColor: UIColor.init(hex6: 0x222222), font: UIFont.systemFont(ofSize: ceilStandardPtf(51)), target: self, action: #selector(leftClick))
 }
 
 */
    



