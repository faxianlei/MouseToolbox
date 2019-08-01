//
//  Style.swift
//  MouseToolbox
//
//  Created by leikai on 2019/7/13.
//  Copyright © 2019 leikai. All rights reserved.
//

import UIKit

struct Style {
    
    /// 控件之间的水平间距
    static let horizontalGap: CGFloat = 8.0
    
    /// 控件之间的垂直间距
    static let verticalGap: CGFloat = 8.0
    
    /// 控件之间的垂直大间距
    static let verticalBigGap: CGFloat = 20.0
    
    /// 最左边子控件与父控件的左侧间距
    static let leftMargin: CGFloat = 20.0
    
    /// 最右边子控件与父控件的右侧间距
    static let rightMargin: CGFloat = 20.0
    
    /// 最上边子控件与父控件的顶部间距
    static let topMargin: CGFloat = 18.0
    
    /// 最下边子控件与父控件的底部间距
    static let bottomMargin: CGFloat = 18.0
    
    /// 默认内容区域
    static let baseContentWidth: CGFloat = screenWidth - Style.leftMargin - Style.rightMargin
    
    /// 默认动画时长
    static let animateDuration: TimeInterval = 0.5
    
    /// App样式自定义
    static func appStyle() {
        //        UINavigationBar.appearance().tintColor = UIColor.appBlack
        //
        //        let normalBarButtonAttr = [NSAttributedStringKey.foregroundColor: UIColor.appBlack,
        //                                   NSAttributedStringKey.font: UIFont.appBoldFont(17)]
        //        UIBarButtonItem.appearance().setTitleTextAttributes(normalBarButtonAttr, for: .normal)
    }
    
}

// MARK: - 项目常用UIColor
extension UIColor {
    
    /// 白
    static let appWhite = UIColor.white
    
    /// 蓝
    static let appBlue = UIColor(hex: "00BFFF")
    
    /// 黑
    static let appBlack = UIColor(hex: "000000")
    
    /// 灰
    static let appGray = UIColor(hex: "B6BBC4")
    
    /// 红色
    static let appRed = UIColor(hex: "DC143C")
    
    /// 粉色
    static let appPink = UIColor(hex: "FFC0CB")
    
}

// MARK: - UIFont
extension UIFont {
    static func appFont(_ size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Regular", size: size)!
        //        return UIFont(name: "Gotham-Book", size: size)!
    }
    
    static func appBoldFont(_ size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Semibold", size: size)!
        //        return UIFont(name: "Gotham-Bold", size: size)!
    }
}
