//
//  ZYTeacherManagerStudentListTableViewCell.swift
//  CreatClassDemo
//
//  Created by bestsu on 2018/9/14.
//  Copyright © 2018年 bestsu. All rights reserved.
//

import UIKit

class ZYTeacherManagerStudentListTableViewCell: UITableViewCell {

    var deleteBtnCallBack: ((Int)->())?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUI(){
        contentView.addSubview(iconImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(deleteBtn)
        
        iconImageView.mas_makeConstraints { (make) in
            make?.centerY.mas_equalTo()(self.contentView)
            make?.left.equalTo()(ceilStandardPtf(57))
            make?.size.mas_equalTo()(CGSize(width: ceilStandardPtf(128), height: ceilStandardPtf(128)))
        }
        
        nameLabel.mas_makeConstraints { (make) in
            make?.centerY.mas_equalTo()(self.contentView)
            make?.left.mas_equalTo()(iconImageView.mas_right)?.setOffset(ceilStandardPtf(20))
        }
        
        deleteBtn.mas_makeConstraints { (make) in
            make?.centerY.mas_equalTo()(self.contentView)
            make?.right.equalTo()(ceilStandardPtf(-20))
            make?.size.mas_equalTo()(CGSize(width: ceilStandardPtf(156), height: ceilStandardPtf(100)))
        }
    }
    
    @objc private func deleteBtnClick(){
        deleteBtnCallBack?(self.tag)
    }
    
    private lazy var iconImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(named: "tongxue")
        view.layer.cornerRadius = ceilStandardPtf(64)
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "小星星"
        label.textAlignment = .left
        label.textColor = UIColor.init(hex6: 0x222222)
        label.font = UIFont.systemFont(ofSize: ceilStandardPtf(39))
        return label
    }()
    
    private lazy var deleteBtn: UIButton = {
        let button = UIButton()
        button.adjustsImageWhenHighlighted = false
        button.setTitle("删除", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: ceilStandardPtf(39))
        button.setTitleColor(UIColor.init(hex: 0x222222, alpha: 0.65), for: .normal)
        button.addTarget(self, action: #selector(deleteBtnClick), for: .touchUpInside)
        return button
    }()
}




