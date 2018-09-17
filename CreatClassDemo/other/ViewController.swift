//
//  ViewController.swift
//  CreatClassDemo
//
//  Created by bestsu on 2018/9/12.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit
import Masonry


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        view.addSubview(iconView)
//        view.addSubview(demoLabel)
        view.addSubview(iconView1)
        
        
        iconView.mas_makeConstraints { (make) in
            make?.left.top().equalTo()(20)
            make?.right.equalTo()(-20)
//            make?.height.equalTo()(ceilStandardPtf(value: 600))
            make?.height.equalTo()(300)
        }
        
        iconView1.mas_makeConstraints { (make) in
            make?.left.equalTo()(20)
            make?.right.bottom().equalTo()(-20)
            make?.height.equalTo()(ceilStandardPtf(600))
        }
        
        
//        demoLabel.mas_makeConstraints { (make) in
//            make?.top.mas_equalTo()(self.iconView.mas_bottom)?.setOffset(50)
//            make?.centerX.mas_equalTo()(self.view)
//            make?.height.equalTo()(40)
//            make?.width.equalTo()(90)
//        }
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let vc = ZYClassManagerViewController()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

    private lazy var iconView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.orange
        return view
    }()
    
    private lazy var iconView1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.orange
        return view
    }()
    
    private lazy var demoLabel: UILabel = {
        let label = UILabel()
        label.text = "demoLabel"
        label.textAlignment = .center
        label.backgroundColor = UIColor.red
        return label
    }()
    
    
    

}

