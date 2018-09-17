//
//  AppDelegate.swift
//  CreatClassDemo
//
//  Created by bestsu on 2018/9/12.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        let tabBarVc = KRTabBarViewController()
        window?.rootViewController = tabBarVc
        window?.backgroundColor = UIColor.white
        let frame = UIScreen.main.bounds
        window?.frame = CGRect(x: 0, y: 0, width: frame.width + 0.000001, height: frame.height + 0.000001)
        window?.makeKeyAndVisible()
        return true
    }



}

