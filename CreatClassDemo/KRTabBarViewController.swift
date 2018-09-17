//
//  XYTabBarViewController.swift
//  koalareading
//
//  Created by 苏文潇 on 2017/3/25.
//  Copyright © 2017年 koalareading. All rights reserved.
//

import UIKit

class KRTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        改变tabbar颜色
        self.tabBar.barTintColor = UIColor.white
//        解决tabbar头部线条的问题
        self.tabBar.backgroundImage = UIImage.imageWithColor(UIColor.white)
        self.tabBar.shadowImage = UIImage()

        self.tabBar.layer.shadowColor = UIColor.init(hex6: 0x4ab94a).cgColor
        self.tabBar.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.tabBar.layer.shadowOpacity = 0.4
        self.tabBar.layer.shadowRadius = 3
        
        setUI()
    }

    private func setUI(){
        addChildViewController(childController: ZYNoneIdentifiCreatViewController(), imageName: "banjiguanli", title: "任务")
        addChildViewController(childController: ViewController(), imageName: "banjiguanli", title: "学情")
        addChildViewController(childController: ViewController1(), imageName: "banjiguanli", title: "我的")
        
        addChildViewController(childController: ZYbanjiclassViewController(), imageName: "banjiguanli", title: "创建班级")
    }
    
    
    // 添加子控制器
    func addChildViewController(childController: UIViewController, imageName: String, title: String){
//        设置图片icon_class
        childController.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
//        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "hui")?.withRenderingMode(.alwaysOriginal)
//        修改tabBar的文字颜色（默认状态和选中状态）
        childController.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.init(hex6: 0x666666)], for: .normal)
        childController.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.init(hex6: 0x0ab88e)], for: .selected)
//        设置标题
//        childController.navigationItem.title = title
//        childController.tabBarItem.title = title
        childController.title = title
//        创建导航控制器
        let naVc = ZYNavigationViewController(rootViewController: childController)
        naVc.navigationBar.shadowImage = UIImage(named: "")
        naVc.navigationBar.barTintColor = UIColor.white
        //        添加子控制器
        addChildViewController(naVc)
    }
}



