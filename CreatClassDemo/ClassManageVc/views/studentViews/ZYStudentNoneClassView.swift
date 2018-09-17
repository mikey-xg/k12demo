//
//  ZYStudentNoneClassView.swift
//  CreatClassDemo
//
//  Created by bestsu on 2018/9/14.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit

class ZYStudentNoneClassView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    convenience init(title: String){
        self.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(){
        addSubview(noneClassImageView)
        addSubview(infoLabel)
        
        noneClassImageView.mas_makeConstraints { (make) in
            make?.centerX.mas_equalTo()(self)
            make?.top.equalTo()(ceilStandardPtf(350))
            make?.size.mas_equalTo()(CGSize(width: ceilStandardPtf(404), height: ceilStandardPtf(464)))
        }
        
        infoLabel.mas_makeConstraints { (make) in
            make?.centerX.mas_equalTo()(self)
            make?.top.mas_equalTo()(noneClassImageView.mas_bottom)?.setOffset(ceilStandardPtf(100))
        }
    }

    private lazy var noneClassImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(named: "Group 6")
        view.sizeToFit()
        return view
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "暂无班级，快加入一个吧~"
        label.textAlignment = .center
        label.textColor = UIColor.init(hex6: 0x999999)
        label.font = UIFont.systemFont(ofSize: ceilStandardPtf(36))
        return label
    }()
    
}




