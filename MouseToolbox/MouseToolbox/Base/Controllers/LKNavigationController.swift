//
//  LKNavigationController.swift
//  MouseToolbox
//
//  Created by leikai on 2019/7/13.
//  Copyright © 2019 leikai. All rights reserved.
//

import UIKit

class LKNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationBar.isTranslucent = true
        automaticallyAdjustsScrollViewInsets = false
        
        /// 隐藏导航栏阴影
        navigationBar.shadowImage = UIImage()
        
        /// 背景色
        navigationBar.barTintColor = UIColor.appPink
        
        /// 返回item颜色
        navigationBar.tintColor = UIColor.appBlack
        
        /// 设置为大标题样式
        if #available(iOS 11.0, *) {
            navigationBar.prefersLargeTitles = true
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
