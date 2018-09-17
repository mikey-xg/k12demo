//
//  ViewController1.swift
//  CreatClassDemo
//
//  Created by bestsu on 2018/9/14.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(demoBtn)
        demoBtn.frame = CGRect(x: view.center.x - 50, y: view.center.y - 50, width: 100, height: 100)
        setColor()
    }
    
    @objc private func demoClick(){
        let vc = ZYTeacherManagerViewController(isExitStudent: false)
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }

    private lazy var demoBtn: UIButton = {
        let button = UIButton()
        button.adjustsImageWhenHighlighted = false
        button.backgroundColor = UIColor.orange
        button.addTarget(self, action: #selector(demoClick), for: .touchUpInside)
        return button
    }()

    
    
    //    渐变色方法
    private func setColor(){
        let gradientColors = [UIColor.orange.cgColor, UIColor.red.cgColor,]
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        //设置渲染的起始结束位置（横向渐变）
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = self.demoBtn.bounds
        self.demoBtn.layer.insertSublayer(gradientLayer, at: 0)
    }

    
    
}
