//
//  LKTimerModel.swift
//  MouseToolbox
//
//  Created by leikai on 2019/7/28.
//  Copyright © 2019 leikai. All rights reserved.
//

import UIKit

class LKTimerModel: NSObject {
    ///开始时间
    var startTimeStr: String = "--/-- --:--:--"
    ///计时 秒
    var timerStr: String = "--:--"
    ///状态 开始 暂停
    var timerState: Bool  = false
}
