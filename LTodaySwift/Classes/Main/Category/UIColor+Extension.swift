//
//  UIColor+Extension.swift
//  LTodaySwift
//
//  Created by liqunfei on 2017/9/5.
//  Copyright © 2017年 LQF. All rights reserved.
//

import UIKit

extension UIColor {
    
    ///RGB
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
    }
    
    
    /// 背景灰
    class func globalBackgroundColor() -> UIColor {
        return UIColor(r: 248, g: 249, b: 247)
    }
 
    class func globalBlueColor() -> UIColor {
        return UIColor(r: 76, g: 173, b: 253)
    }
    
    ///红色
    class func globalRedColor() -> UIColor {
        return UIColor(r: 210, g: 63, b: 66)
    }
}
