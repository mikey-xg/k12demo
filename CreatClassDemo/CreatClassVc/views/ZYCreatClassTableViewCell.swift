//
//  ZYCreatClassTableViewCell.swift
//  CreatClassDemo
//
//  Created by 苏文潇 on 2018/9/16.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit

class ZYCreatClassTableViewCell: UITableViewCell {

    var isClick: Bool?{
        didSet{
            if isClick == true{
                self.backgroundColor = UIColor.white
                self.leftLineView.isHidden = false
            }else{
                self.backgroundColor = UIColor.init(hex: 0x222222, alpha: 0.05)
                self.leftLineView.isHidden = true
            }
        }
    }
    
    var className: String?{
        didSet{
            self.titleLable.text = className
        }
    }
    
    private func setNormalColor(){
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        self.backgroundColor = UIColor.init(hex: 0x222222, alpha: 0.05)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(){
        contentView.addSubview(titleLable)
        contentView.addSubview(lineView)
        contentView.addSubview(leftLineView)
        
        titleLable.mas_makeConstraints { (make) in
            make?.edges.mas_equalTo()(contentView)
        }
        
        lineView.mas_makeConstraints { (make) in
            make?.bottom.left().right().mas_equalTo()(contentView)
            make?.height.equalTo()(ceilStandardPtf(1))

        }
        
        leftLineView.mas_makeConstraints { (make) in
            make?.left.top().bottom().mas_equalTo()(contentView)
            make?.width.equalTo()(ceilStandardPtf(3))
        }
        
    }
    
    
    private lazy var titleLable: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.init(hex: 0x222222, alpha: 0.65)
        label.font = UIFont.boldSystemFont(ofSize: ceilStandardPtf(39))
        label.textAlignment = .center
        return label
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: 0x222222, alpha: 0.1)
        return view
    }()
    
    private lazy var leftLineView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.backgroundColor = UIColor.init(hex6: 0x2BC17C)
        view.layer.masksToBounds = true
        return view
    }()
}




