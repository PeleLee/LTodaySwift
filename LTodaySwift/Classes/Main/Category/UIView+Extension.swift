//
//  UIView+Extension.swift
//  LTodaySwift
//
//  Created by liqunfei on 2017/9/5.
//  Copyright © 2017年 LQF. All rights reserved.
//

import UIKit

extension UIView {
    
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            var tmpFrame: CGRect = frame
            tmpFrame.origin.x    = newValue
            frame                = tmpFrame
        }
    }
    
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            var tmpFrame: CGRect = frame
            tmpFrame.origin.y    = newValue
            frame                = tmpFrame
        }
    }
    
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
    
    var centerX: CGFloat {
        get {
            return center.x
        }
        set {
            var tmpCenter: CGPoint = center
            tmpCenter.x = newValue
            center = tmpCenter
        }
    }
    
    var centerY: CGFloat {
        get {
            return center.y
        }
        set {
            var tmpCenter: CGPoint = center
            tmpCenter.y = newValue
            center = tmpCenter
        }
    }
    
}
