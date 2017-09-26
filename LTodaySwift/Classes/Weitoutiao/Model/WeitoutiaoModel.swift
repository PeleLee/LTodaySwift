//
//  WeitoutiaoModel.swift
//  LTodaySwift
//
//  Created by liqunfei on 2017/9/25.
//  Copyright © 2017年 LQF. All rights reserved.
//

import UIKit

class WeitoutiaoModel: NSObject {

    var relateNewsCellHeight: CGFloat? {
        get {
            let size = CGSize(width: screenWidth - 30*2, height: CGFloat(MAXFLOAT))
            return (title!.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 15)], context: nil).size.height) + 30
        }
    }
    
//    var girlCellHeight: CGFloat? {
//        get {
////            return c
//        }
//    }
    
    var content: NSString?
    
//    var contentH: CGFloat? {
//        get {
//            if let content = content {
////                let height = content.gette
//                
//            }
//        }
//    }
    
    
    var title: NSString?
    
    
    var image_list = [WTTImageList]()
    
    //----------------- article -----------------
    var impr_id: String?
    var open_page_url: String?
    
    
    init(dict: [String: AnyObject]) {
        impr_id = dict["impr_id"] as? String
        open_page_url = dict["open_page_url"] as? String
        
        if let largeImage = dict["large_image"] as? [String: AnyObject] {
            
        }
    }
}

class WTTImageList {
    var url: String?
    
}
