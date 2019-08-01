//
//  LKHomeCell.swift
//  MouseToolbox
//
//  Created by leikai on 2019/7/28.
//  Copyright © 2019 leikai. All rights reserved.
//

import UIKit

class LKHomeCell: LKTableViewCell {

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        createBase()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model = LKHomeModel() {
        didSet {
            bgView.backgroundColor = model.bgColor
            iconView.image = UIImage(named: model.iconName)
            titleLabel.text = model.title
        }
    }
    
    func createBase() {
        
        contentView.addSubview(bgView)
        contentView.addSubview(iconView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(arrowView)
        
        bgView.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(10.0)
            make.bottom.equalTo(contentView)
            make.left.equalTo(contentView.snp.left).offset(20.0)
            make.right.equalTo(contentView.snp.right).offset(-20.0)
        }
        
        iconView.snp.makeConstraints { (make) in
            make.top.equalTo(bgView.snp.top).offset(15.0)
            make.left.equalTo(bgView.snp.left).offset(10.0)
            make.width.height.equalTo(30.0)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(iconView.snp.right).offset(20.0)
            make.centerY.equalTo(iconView.snp.centerY)
        }
        
        arrowView.snp.makeConstraints { (make) in
            make.right.equalTo(bgView.snp.right).offset(-20.0)
            make.centerY.equalTo(bgView.snp.centerY)
            make.width.equalTo(12.0)
            make.height.equalTo(18.0)
        }
        
    }
    
    lazy var bgView: UIView = {
        let bgView = UIView(frame: .zero)
        bgView.layer.cornerRadius = 8.0
        bgView.layer.masksToBounds = true
        return bgView
    }()
    
    lazy var iconView: UIImageView = {
        let iconView = UIImageView(frame: .zero)
        return iconView
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel(frame: .zero)
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.appBoldFont(20.0)
        titleLabel.textColor = UIColor.appBlack
        return titleLabel
    }()
    
    lazy var arrowView: UIImageView = {
        let arrowView = UIImageView(frame: .zero)
        arrowView.image = UIImage(named: "home_arrow")
        return arrowView
    }()
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
