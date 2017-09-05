//
//  UIView+Extension.swift
//  LTodaySwift
//
//  Created by liqunfei on 2017/9/5.
//  Copyright © 2017年 LQF. All rights reserved.
//

import UIKit

extension UIView {
    
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            var tmpFrame         = frame
            tmpFrame.size.height = newValue
            frame                = tmpFrame
        }
    }
    
    
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            var tmpFrame        = frame
            tmpFrame.size.width = newValue
            frame               = tmpFrame
        }
    }
    
    
}
