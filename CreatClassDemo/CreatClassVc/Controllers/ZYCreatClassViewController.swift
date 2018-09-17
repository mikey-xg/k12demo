//
//  ZYCreatClassViewController.swift
//  CreatClassDemo
//
//  Created by 苏文潇 on 2018/9/16.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit

class ZYCreatClassViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        setUI()
    }

    private func setUI(){
        self.view.addSubview(classView)
       
        
        classView.mas_makeConstraints { (make) in
            make?.edges.mas_equalTo()(view)
        }
    
        
    }
 
    private lazy var classView: ZYTeacherCreatClassView = {
        let view = ZYTeacherCreatClassView()
        return view
    }()
    

    
    
}




