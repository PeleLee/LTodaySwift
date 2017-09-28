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
    
    var girlCellHeight: CGFloat? {
        get {
            return contentH! + 75 + screenWidth*1.4
        }
    }
    
    var large_image: WTTDetailVideoLargeImage?
    
    var imageCellHeight: CGFloat? {
        get {
            let imageHeight = screenWidth*0.9/16 + titleH!
            return imageHeight + 50
        }
    }
    
    var jokeCellHeight: CGFloat? {
        get {
            return 75 + contentH!
        }
    }
    
    var homeCellHeight: CGFloat? {
        get {
            var height: CGFloat = 0
            if titleH != nil {
                height += titleH!
            }
            
            if let hasImage = has_image {
                if hasImage {
                    //说明有图片
                    let imageW = (screenWidth - 2*kMargin - 2*6)/3
                    if image_list.count > 0 {
                        if image_list.count == 1 {
                            let imageH = imageW*0.8
                            return imageH
                        }
                        else {
                            let imageH = imageW*0.8
                            height += imageH
                        }
                    }
                    else {
                        if large_image_list.count > 0 {
                            let largeImageW = screenWidth - 2*kMargin
                            let largeImageH = largeImageW*0.8
                            height += largeImageH
                        }
                        else if middle_image != nil {
                            let imageH = imageW*0.8
                            return imageH
                        }
                    }
                }
                if has_video! {
                    //视频
                    let videoW = screenWidth - 2*kMargin
                    let videoH = videoW*0.55
                    height += videoH
                }
            }
            else {
                if thumb_image_list.count != 0 {
                    //1 or 2
                    let imageWidth1or2 = (screenWidth - kMargin*2 - 6)*0.5
                    // >= 3
                    let imageH = (screenWidth - kMargin*2 - 12)/3
                    switch thumb_image_list.count {
                    case 1,2:
                        height += imageWidth1or2
                    case 3:
                        height += imageH
                    case 4...6:
                        height += (imageH*2 + 3)
                    case 7...9:
                        height += (imageH*3 + 6)
                    default:
                        height += 0
                    }
                }
            }
            
            // 12 是标题距离顶部的间距，40 是底部 view 的高度，7 是 标题距离中间 view 的间距
            return height + 12 + 40 + 7
        }
    }
    
    /// 置顶
    var label: String?    
    
    var large_image_list = [WTTLargeImageList]()
    
    var user_info: WTTUser?
    
    var comment_count: Int?
    
    var behot_time: TimeInterval?
    var publich_time: TimeInterval?
    var create_time:TimeInterval?
    var createTime: String? {
        get {
            return "xxxxxxxxxxxxx"
            /*
            //创建时间
            var createDate: Date?
            if let publicTime = publich_time {
                createDate = Date(timeIntervalSince1970: publicTime)
            }
            else if let createTime = create_time {
                createDate = Date(timeIntervalSince1970: createTime)
            }
            else if behot_time != nil {
                createDate = Date(timeIntervalSince1970: behot_time!)
            }
            let fmt = DateFormatter()
            fmt.locale = Locale(identifier: "zh_CN")
            fmt.dateFormat = "yyyy-MM-dd HH:mm:ss"
            //当前时间
            let now = Date()
            //日历
            let calendar = Calendar.current
            let comps: DateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: createDate!, to: now)
            guard (createDate?.isYesterday())! else {
                //今年
                fmt.dateFormat = "yyyy-MM-dd HH:mm:ss"
                return fmt.string(from: createDate!)
            }
            
            if (createDate?.isYesterday())! {
                //昨天
                fmt.dateFormat = "昨天 HH:mm"
                return fmt.string(from: createDate!)
            }
            else if (createDate?.isToday())! {
                if comps.hour! >= 1 {
                    return String(format: "%.d小时前", comps.hour!)
                }
                else if comps.minute! >= 1 {
                    return String(format: "%d分钟前", comps.minute!)
                }
                else {
                    return "刚刚";
                }
            }
            else {
                fmt.dateFormat = "MM-dd HH:mm"
                return fmt.string(from: createDate!)
            }*/
        }
    }
    
    
    /// 阅读量
    var read_count: Int?
    var readCount: String? {
        get {
            guard let count = read_count  else { return "0" }
            guard count >= 10000 else {
                return String(describing: count)
            }
            return String(format: "%.1f万", Float(count)/10000.0)
        }
    }
    
    
    var content: NSString?
    var contentH: CGFloat? {
        get {
            if let content = content {
                let height = content.getTextHeight(width: screenWidth - kMargin*2)
                return height
            }
            else {
                return 0
            }
        }
    }
    
    
    var title: NSString?
    var titleH: CGFloat? {
        get {
            return title?.getTextHeight(width: screenWidth - kMargin*2)
        }
    }
    
    var is_stick: Bool?
    
    var image_list = [WTTImageList]()
    var thumb_image_list = [WTTThumbImageList]()
    
    
    //----------------- article -----------------
    var impr_id: String?
    var open_page_url: String?
    
    var has_image: Bool?
    var has_video: Bool?
    
    
    var middle_image: WTTMiddleImage?
    var hot: Bool?    
    
    var media_info: WTTMediaInfo?
    
    var source: String?
    
    var video_detail_info: WTTVideoDetailInfo?
    var videoDuration: Int?
    var video_duration: String? {
        get {
            ///格式化时间
            let hour = videoDuration! / 3600
            let minute = (videoDuration! / 60) % 60
            let second = videoDuration! % 60
            if hour > 0 {
                return String(format: "%02d:%02d:%02d", hour, minute, second)
            }
            return String(format: "%02d:%02d", minute, second)
        }
    }
    
    var keywords: String?
    
    var gallary_image_count: Int?
    var gallery_pic_count: Int?
    
    
    init(dict: [String: AnyObject]) {
        impr_id = dict["impr_id"] as? String
        open_page_url = dict["open_page_url"] as? String
        
        if let largeImage = dict["large_image"] as? [String: AnyObject] {
            large_image = WTTDetailVideoLargeImage(dict: largeImage)
        }
        gallary_image_count = dict["gallary_image_count"] as? Int
        gallery_pic_count = dict["gallery_pic_count"] as? Int
        is_stick = dict["is_stick"] as? Bool
        label = dict["label"] as? String
        keywords = dict["keywords"] as? String
        
        videoDuration = dict["video_duration"] as? Int
        //续
//        vid
    }
}

class WTTDetailVideoLargeImage {
    var height: CGFloat?
    var width:CGFloat?
    
    var url: String?
    var url_list = [WTTURLList]()
    
    init(dict: [String: AnyObject]) {
        height = dict["height"] as? CGFloat
        width = dict["width"] as? CGFloat
        url = dict["url"] as? String
        if let urlLists = dict["url_list"] as? [AnyObject] {
            for urlDict in urlLists {
                let wttURLList = WTTURLList(dict: urlDict as! [String: AnyObject])
                url_list.append(wttURLList)
            }
        }
    }
}

class WTTMiddleImage {
    var height: CGFloat?
    var width: CGFloat?
    
    var url: String?
    
    var url_list = [WTTURLList]()
    
    init(dict: [String: AnyObject]) {
        height = dict["height"] as? CGFloat
        width = dict["width"] as? CGFloat
        if let urlString = dict["url"] as? String {
            if urlString.hasSuffix(".webp") {
                let index = urlString.index(urlString.endIndex, offsetBy: -5)
                url = urlString.substring(to: index)
            }
            else {
                url = urlString as String
            }
        }
        
        if let urlLists = dict["url_list"] as? [AnyObject] {
            for urlDict in urlLists {
                let wtrURLList = WTTURLList(dict: urlDict as! [String: AnyObject])
                url_list.append(wtrURLList)
            }
        }
        
    }
}

class WTTLargeImageList {
    var height: CGFloat?
    var width: CGFloat?
    
    var type: Int?
    
    var uri: String?
    
    var url: String?
    
    var url_list = [WTTURLList]()
    
    init(dict: [String: AnyObject]) {
        height = dict["height"] as? CGFloat
        width = dict["width"] as? CGFloat
        type = dict["type"] as? Int
        uri = dict["uri"] as? String
        url = dict["url"] as? String
        if let urlLists = dict["url_list"] as? [AnyObject] {
            for urlDict in urlLists {
                let wttURLList = WTTURLList(dict: urlDict as! [String : AnyObject])
                url_list.append(wttURLList)
            }
        }
    }
}

class WTTThumbImageList {
    var height: CGFloat?
    var width: CGFloat?
    
    var type: Int?
    var uri: String?
    var url: String?
    var url_list = [WTTURLList]()
    
    init(dict: [String: AnyObject]) {
        height = dict["height"] as? CGFloat
        width = dict["width"] as? CGFloat
        type = dict["type"] as? Int
        uri = dict["uri"] as? String
        url = dict["url"] as? String
        if let urlLists = dict["url_list"] as? [AnyObject] {
            for urlDict in urlLists {
                let wtrURLList = WTTURLList(dict: urlDict as! [String: AnyObject])
                url_list.append(wtrURLList)
            }
        }
    }
}

class WTTURLList {
    var url: String?
    
    init(dict: [String: AnyObject]) {
        url = dict["url"] as? String
    }
}

class WTTImageList {
    var url: String?
    
}

class WTTVideoDetailInfo {
    var direct_play: Int?
    var group_flags: Int?
    var show_pgc_subscribe: Int?
    var video_id: String?
    var video_preloading_flag: Bool?
    var video_type: Int?
    var video_watch_count: Int?
    var video_watching_count: Int?
    var videoWatchCount: String? {
        get {
            guard let count = video_watch_count else {
                return "0"
            }
            guard count >= 10000 else {
                return String(describing: count)
            }
            return String(format: "%.1f", Float(count)/10000.0)
        }
    }
    
    var detail_video_large_image: WTTDetailVideoLargeImage?
    
    init(dict: [String: AnyObject]) {
        video_watching_count = dict["video_watching_count"] as? Int
        video_watch_count = dict["video_watch_count"] as? Int
        video_type = dict["video_type"] as? Int
        video_preloading_flag = dict["video_preloading_flag"] as? Bool
        video_id = dict["video_id"] as? String
        direct_play = dict["direct_play"] as? Int
        group_flags = dict["group_flags"] as? Int
        show_pgc_subscribe = dict["show_pgc_subscribe"] as? Int
        if let detailVideoLargeImage = dict["detail_video_large_image"] as? [String: AnyObject] {
            detail_video_large_image = WTTDetailVideoLargeImage(dict: detailVideoLargeImage)
        }
    }
}

class WTTUser {
    var avatar_url: String?
    var desc: String?
    var description: String?
    var media_id: Int?
    var create_time: TimeInterval?
    var last_update: String?
    var type: Int?
    
    var is_following: Bool?
    var is_followed: Bool?
    var is_friend: Bool?
    var follower_count: Int?
    var follow: Int?
    
    var schema: String?
    var screen_name: String?
    var name: String?
    
    var userAuthInfo: WTTUserAuthInfo?
    var user_id: Int?
    var user_verified: Bool?
    
    init(dict: [String: AnyObject]) {
        type = dict["type"] as? Int
        last_update = dict["last_update"] as? String
        media_id = dict["media_id"] as? Int
        create_time = dict["create_time"] as? TimeInterval
        user_id = dict["user_id"] as? Int
        user_verified = dict["user_verified"] as? Bool
        is_following = dict["is_following"] as? Bool
        is_followed = dict["is_followed"] as? Bool
        is_friend = dict["is_friend"] as? Bool
        follower_count = dict["follower_count"] as? Int
        follow = dict["follow"] as? Int
        avatar_url = dict["avatar_url"] as? String
        desc = dict["desc"] as? String
        description = dict["description"] as? String
        schema = dict["schema"] as? String
        screen_name = dict["screen_name"] as? String
        name = dict["name"] as? String
        
        if let user_auth_info = dict["user_auth_info"] {
            if user_auth_info as! String == "" {
                return
            }
            let data = user_auth_info.data(using: String.Encoding.utf8.rawValue)! as Data
            let dict = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            userAuthInfo = WTTUserAuthInfo(dict: dict as! [String : AnyObject])
        }
    }
}

class WTTUserAuthInfo {
    var auth_type: Int?
    var auth_info: String?
    
    init(dict: [String: AnyObject]) {
        auth_type = dict["auth_type"] as? Int
        auth_info = dict["auth_info"] as? String
    }
}

class WTTMediaInfo {
    var avatar_url: String?
    var name: String?
    var media_id: Int?
    var user_verified: Int?
    var follow: Bool?
    
    var is_star_user: Bool?
    var recommend_reason: String?
    var recommend_type: Int?
    var user_id: Int?
    var verified_content: String?
    
    init(dict: [String: AnyObject]) {
        avatar_url = dict["avatar_url"] as? String
        name = dict["name"] as? String
        user_verified = dict["user_verified"] as? Int
        media_id = dict["media_id"] as? Int
        follow = dict["follow"] as? Bool
        is_star_user = dict["is_star_user"] as? Bool
        recommend_reason = dict["recommend_reason"] as? String
        verified_content = dict["verified_content"] as? String
        recommend_type = dict["recommend_type"] as? Int
        user_id = dict["user_id"] as? Int
    }
}
