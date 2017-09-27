//
//  String+Extension.swift
//  LTodaySwift
//
//  Created by liqunfei on 2017/9/26.
//  Copyright © 2017年 LQF. All rights reserved.
//

import Foundation
import UIKit

//extension String {
//    //自定义下标
//    subscript (range: Range<Int>) -> String {
//        get {
//            let startIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
//            let endIndex = self.index(self.startIndex, offsetBy: range.upperBound)
//            return self[Range(startIndex..<endIndex)]
//        }
//
//        set {
//            let startIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
//            let endIndex = self.index(self.startIndex, offsetBy: range.upperBound)
//            let strRange = Range(startIndex..<endIndex)
//            self.replaceSubrange(strRange, with: newValue)
//        }
//    }
//}

extension NSString {
    func getTextHeight(width: CGFloat) -> CGFloat {
        let size = CGSize(width: width, height: CGFloat(MAXFLOAT))
        return (self.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: 16)], context: nil).size.height)
    }
}
