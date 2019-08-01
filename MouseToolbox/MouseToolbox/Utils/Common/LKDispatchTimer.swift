//
//  LKDispatchTimer.swift
//  MouseToolbox
//
//  Created by leikai on 2019/7/14.
//  Copyright © 2019 leikai. All rights reserved.
//

import UIKit

public protocol LKDispatchTimerDelegate {
    func updateTimer(second: Int)
}

class LKDispatchTimer: NSObject {
    var timer: DispatchSourceTimer?
    var second = 0
    var delegate: LKDispatchTimerDelegate?
    
    func addTimer() {
        // 子线程创建timer
        if timer == nil {
            timer = DispatchSource.makeTimerSource(flags:[], queue: DispatchQueue.global())
            //        timer = DispatchSource.makeTimerSource()
            /*
             dealine: 开始执行时间
             repeating: 重复时间间隔
             leeway: 时间精度
             */
            timer?.schedule(deadline: .now(), repeating: 1)
            
            //        timer?.schedule(deadline: .now() + .seconds(5), repeating: DispatchTimeInterval.seconds(1), leeway: DispatchTimeInterval.seconds(0))
            // timer 添加事件
            timer?.setEventHandler {[weak self] in
                //            print("加1")
                self?.second += 1
                // 返回主线程处理一些事件，更新UI等等
                DispatchQueue.main.async {
                    if self?.delegate != nil {
                        self?.delegate?.updateTimer(second: self?.second ?? 0)
                    }
                }
                print(self?.second ?? "")
            }
        }
        

        timer?.resume()
//        timer?.activate()


    }
    // timer暂停
    func stopTimer() {
        timer?.suspend()
    }
    // timer结束
    func cancleTimer() {
        guard let t = timer else {
            return
        }
        t.cancel()
        timer = nil
    }
    
    
}
