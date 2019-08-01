

//
//  LKDateFormater.swift
//  MouseToolbox
//
//  Created by leikai on 2019/7/14.
//  Copyright © 2019 leikai. All rights reserved.
//

import UIKit

class LKDateFormater: NSObject {
    
    static func normal(time: TimeInterval) -> String {
        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        dateFormatter.dateFormat = "MM/dd HH:mm:ss"
        let string = dateFormatter.string(from: Date(timeIntervalSince1970: time))
        return string
    }
    
    static func timeToString(time: TimeInterval) -> String {
        
        let now = Date().timeIntervalSince1970
        
        guard  now - time > 0 else {
            return ""
        }
        
        let sec: Double = abs(now - time)
        let min: Double = round(sec/60)
        let hr: Double = round(min/60)
        let d: Double = round(hr/24)
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        
        let year = dateFormatter.string(from: Date())
        
        let currentYear: String = year + "年01月01日 00:00:00"
        dateFormatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        
        let curYearTime: TimeInterval = (dateFormatter.date(from: currentYear)?.timeIntervalSince1970)!
        return ""
        
    }
    
}
