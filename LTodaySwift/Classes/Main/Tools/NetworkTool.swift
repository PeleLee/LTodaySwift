//
//  NetworkTool.swift
//  LTodaySwift
//
//  Created by liqunfei on 2017/9/6.
//  Copyright © 2017年 LQF. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NetworkTool {
    
    
    /// 首页 home
    ///
    /// - Parameters:
    ///   - fromViewController: <#fromViewController description#>
    ///   - completionHandler: <#completionHandler description#>
    class func loadHomeTitlesData(fromViewController: String, completionHandler: @escaping (_ topTitles: [TopicTitle], _ homeTopicVCs: [LQFTopicVC]) -> ()) {
        let url = BASE_URL + "article/category/get_subscribed/v1/?"
        let params = ["device_id" : device_id,
                      "aid" : 13,
                      "iid" :IID] as [String : Any]
        Alamofire.request(url, parameters: params).responseJSON { (response) in
            guard response.result.isSuccess else {
                return
            }
            if let value = response.result.value {
                let json = JSON(value)
                let dataDict = json["data"].dictionary
                if let data = dataDict!["data"]!.arrayObject {
                    var titles = [TopicTitle]()
//                    var homeTopicVCs = []
                }
            }
        }
    }
    
}
