//
//  ZYStatusBarViewController.swift
//  CreatClassDemo
//
//  Created by bestsu on 2018/9/12.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit

class ZYStatusBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.setBackgroundImage(UIImage.init(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage.init()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}
