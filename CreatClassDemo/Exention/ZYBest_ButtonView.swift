//
//  ZYBest_ButtonView.swift
//  CreatClassDemo
//
//  Created by bestsu on 2018/9/14.
//  Copyright © 2018年 bestsu. All rights reserved.

/*
    使用方法： 注意，仅仅支持底部的那种按钮方式，其他的抽时间在写

 dmeoView.mas_makeConstraints { (make) in
    make?.left.bottom().right().mas_equalTo()(view)
    make?.height.equalTo()(ceilStandardPtf(171))
 }
 
 private lazy var dmeoView: ZYBest_ButtonView = {
    let view = ZYBest_ButtonView()
    //注意： 这里 当 isSelect == false 的话 默认是不可点击的，设置的时候注意 默认是false
    view.isSelected = true
    // 默认没有名字
    view.titleName = "你好世界"
    // 也可以这么用(如果设置这一个的话，下面的两个方法就可以不用设置了)
    //view.image = UIImage.init(named: "button")
    // 如果设置了上面的iamge，下面的这两个可以不用 ，但是现实不了两种状态
    view.setImage(image: UIImage.init(named: "button copy"), for: .normal)
    view.setImage(image: UIImage.init(named: "button"), for: .selected)
    view.addTarget(self, action: #selector(demoClick), for: .touchUpInside)
    return view
 }()
 
 @objc private func demoClick(){
    print("dmeoview click finish")
 }

 */

import UIKit
class ZYBest_ButtonView: UIControl {
    
    var controlState: UIControlState = .normal
    var normalImage: UIImage?
    var selectImage: UIImage?
    /// 设置名字
    var titleName: String?{
        didSet{
            self.nameLabel.text = titleName ?? ""
        }
    }
    /// 字体大小
    var font: UIFont? {
        didSet{
            self.nameLabel.font = font
        }
    }
    
    /// 可以单独设置image (如果调用setImage方法，这里无效)
    var image: UIImage?{
        didSet{
            self.iconImageView.image = image
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        setShadow()
        setUI()
        setGuester()
    }
    // 设置阴影效果
    private func setShadow(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowRadius = 5
        self.layer.shadowOffset = CGSize(width: 0, height: -2)
    }
    /// 选中状态
    override var isSelected: Bool{
        didSet{
            setStyle(isSelect: isSelected)
        }
    }
    
    private func setStyle(isSelect: Bool){
        if normalImage == nil{
            iconImageView.image = selectImage
        }else if selectImage == nil{
            iconImageView.image = normalImage
        }else if normalImage == nil && selectImage == nil{
            if image != nil{
                iconImageView.image = image
            }
        }else{
            if isSelected == true{
                iconImageView.image = selectImage
            }else{
                iconImageView.image = normalImage
            }
        }
    }
    
    /// 设置图片
    func setImage(image: UIImage?, for: UIControlState?){
        guard let state = `for` else { return }
        controlState = state
        if state == .normal{
            normalImage = image
        }else{
            selectImage = image
        }
        setStyle(isSelect: self.isSelected)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(){
        addSubview(iconImageView)
        addSubview(nameLabel)
        
        iconImageView.mas_makeConstraints { (make) in
            make?.center.mas_equalTo()(self)
            make?.size.mas_equalTo()(CGSize(width: ceilStandardPtf(840), height: ceilStandardPtf(135)))
        }
        nameLabel.mas_makeConstraints { (make) in
            make?.center.mas_equalTo()(iconImageView)
        }
    }
    
    private func setGuester(){
        let guester = UITapGestureRecognizer.init(target: self, action: #selector(guesterClick))
        self.addGestureRecognizer(guester)
    }
    
    @objc private func guesterClick(){
        if isSelected == false{ return }
        self.sendActions(for: .touchUpInside)
    }
    
    private lazy var iconImageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: ceilStandardPtf(48))
        return label
    }()
    
}
