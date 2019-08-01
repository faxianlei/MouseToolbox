//
//  Global.swift
//  MouseToolbox
//
//  Created by leikai on 2019/7/13.
//  Copyright © 2019 leikai. All rights reserved.
//

import UIKit

@objc class Global: NSObject {
    // MARK: - - 单例
    @objc static let shared: Global = Global()
    
    // MARK: - 成员变量
    /// 是否为iPhoneX
//    @objc fileprivate(set) var iPhoneX: Bool = false
    /// 导航栏高度 （默认44.0）
    @objc fileprivate(set) var navBarHeight: CGFloat = 44.0
    /// 导航栏加状态栏（iPhoneX的Notch）高度
    @objc fileprivate(set) var navAndStatusBarHeight: CGFloat = 64.0
    /// tabbar 高度
    @objc fileprivate(set) var tabbarHeight: CGFloat = 49.0
    /// 顶部状态栏高度
    @objc fileprivate(set) var statusBarHeight: CGFloat = 20.0

    
}


