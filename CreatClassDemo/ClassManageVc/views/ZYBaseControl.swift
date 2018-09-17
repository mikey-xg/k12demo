//
//  ZYBaseControl.swift
//  CreatClassDemo
//
//  Created by bestsu on 2018/9/15.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit

class ZYBaseControl: UIControl {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUserInterface()
        setGuester()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUserInterface() {}
    
    private func setGuester(){
        let guester = UITapGestureRecognizer.init(target: self, action: #selector(guesterClick))
        self.addGestureRecognizer(guester)
    }
    
    @objc private func guesterClick(){
        self.sendActions(for: .touchUpInside)
    }
    
    deinit {
        print(self, "销毁了---> 🌶🌶🌶")
    }
}
