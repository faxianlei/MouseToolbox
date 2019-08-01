//
//  LKHomeModel.swift
//  MouseToolbox
//
//  Created by leikai on 2019/7/28.
//  Copyright © 2019 leikai. All rights reserved.
//

import UIKit

class LKHomeModel: NSObject {
    
    var iconName = String()
    var title = String()
    var bgColor = UIColor()
    
    override init() {
        super.init()
    }
    
    init(iconName: String, title: String, bgColor: UIColor) {
        self.iconName = iconName
        self.title = title
        self.bgColor = bgColor
    }
    
}
