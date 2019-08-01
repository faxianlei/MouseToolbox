//
//  LKTimerCell.swift
//  MouseToolbox
//
//  Created by leikai on 2019/7/13.
//  Copyright © 2019 leikai. All rights reserved.
//

import UIKit

protocol LKTableViewCellDelegate {
    func updateTimer(cell: LKTableViewCell,second: Int)
}

class LKTimerCell: LKTableViewCell {

    var model = LKTimerModel() {
        didSet {
            startTimeLable.text = model.startTimeStr
            timerLable.text = model.timerStr
        }
    }
    var currentIndexPath = IndexPath() {
        didSet {
            tagLabel.text = String("\(currentIndexPath.row+1)")
            if (currentIndexPath.row % 2 == 1) {
                tagLabel.backgroundColor = UIColor.appPink
            }else {
                tagLabel.backgroundColor = UIColor.appBlue
            }
        }
    }
    var interval =  1.0
    var timer = LKDispatchTimer()
    var delegate: LKTableViewCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        createBase()
        timer.delegate = self;

    }
    
    @objc func refresh() {
        if model.timerState == true {
        }
    }
    
    func createBase() {
        contentView.addSubview(tagLabel)
        contentView.addSubview(timerLable)
        contentView.addSubview(startTimeLable)
        contentView.addSubview(button)
        
        tagLabel.snp.makeConstraints { (make) in
            make.top.left.height.equalTo(contentView)
//            make.left.equalTo(contentView.snp.top)
//            make.height.equalTo(contentView.snp.height)
            make.width.equalTo(20.0)
        }
        
        timerLable.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(5.0)
            make.left.equalTo(contentView.snp.left).offset(20.0)
        }
        
        startTimeLable.snp.makeConstraints { (make) in
            make.bottom.equalTo(contentView.snp.bottom).offset(-5.0)
            make.left.equalTo(timerLable.snp.left)
        }
        
        button.snp.makeConstraints { (make) in
            make.right.equalTo(contentView.snp.right).offset(-20.0)
            make.centerY.equalTo(contentView.snp.centerY)
            make.width.height.equalTo(32.0)
        }
        
    }
    
    @objc func clickButton(button: UIButton) {
        
        button.isSelected = !button.isSelected
        model.timerState = button.isSelected
        if button.isSelected {
            timer.addTimer()
            startTimeLable.text = LKDateFormater.normal(time: Date().timeIntervalSince1970)
//            button.setTitle("暂停", for: .normal)
//            button.backgroundColor = UIColor.appRed
            button.setImage(UIImage(named: "timer_pause"), for: .normal)
            button.setImage(UIImage(named: "timer_pause"), for: .highlighted)
        } else {
            timer.stopTimer()
//            button.setTitle("开始", for: .normal)
//            button.backgroundColor = UIColor.appBlue
            button.setImage(UIImage(named: "timer_start"), for: .normal)
            button.setImage(UIImage(named: "timer_start"), for: .highlighted)
        }
    }
    
    // MARK: - Lazy
    lazy var tagLabel: UILabel = {
        let tagLabel = UILabel(frame: .zero)
        tagLabel.font = UIFont.appFont(6.0)
        tagLabel.textColor = UIColor.appBlack
        tagLabel.backgroundColor = UIColor.appPink
        tagLabel.textAlignment = .center
        return tagLabel
    }()
    
    lazy var timerLable: UILabel = {
        let timerLable = UILabel(frame: .zero)
        timerLable.font = UIFont.appBoldFont(26.0)
        timerLable.textColor = UIColor.appBlack
        timerLable.textAlignment = .left
        return timerLable
    }()
    
    lazy var startTimeLable: UILabel = {
        let startTimeLable = UILabel(frame: .zero)
        startTimeLable.font = UIFont.appFont(12.0)
        startTimeLable.textColor = UIColor.appBlue
        startTimeLable.textAlignment = .left
        return startTimeLable
    }()
    
    
    lazy var button: UIButton = {
        let button = UIButton(type: .custom)
//        button.backgroundColor = UIColor.appBlue
//        button.setTitle("开始", for: .normal)
        button.setImage(UIImage(named: "timer_start"), for: .normal)
        button.setImage(UIImage(named: "timer_start"), for: .highlighted)
        button.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
//        button.layer.cornerRadius = 8.0
//        button.layer.masksToBounds = true
        return button
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


extension LKTimerCell: LKDispatchTimerDelegate {
    
    func updateTimer(second:Int) {
        if self.delegate != nil {
            self.delegate?.updateTimer(cell: self, second: second)
        }
        let sec = second%60;
        let min = Int(second/60)
        //        let hr: Double = round(min/60)
        var secStr = ""
        if sec < 10 {
            secStr = String("0\(sec)")
        }else {
            secStr = String("\(sec)")
        }
        
        
        if second < 60 {
            timerLable.text = String("00:\(secStr)")
        }else if min < 10 {
            timerLable.text = String("0\(min):\(secStr)")
        }else {
            timerLable.text = String("\(min):\(secStr)")
        }
    }

}
