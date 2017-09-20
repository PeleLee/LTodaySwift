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
    /// 参数包含闭包 联想成block
    /// - Parameters:
    ///   - fromViewController: string
    ///   - completionHandler: xxx
    class func loadHomeTitlesData(fromViewController: String, completionHandler: @escaping (_ topTitles: [TopicTitle], _ homeTopicVCs: [LQFTopicVC]) -> ()) {
        let url = BASE_URL + "article/category/get_subscribed/v1/?"
        //as:配合AnyObject使用
        let params = ["device_id" : device_id,
                      "aid" : 13,
                      "iid" :IID] as [String : Any]
        Alamofire.request(url, parameters: params).responseJSON { (response) in
            //guard:与if类似，判断是否需要执行
            //与if语句不同的是，guard只有在条件不满足的时候才会执行
            guard response.result.isSuccess else {
                return
            }
            if let value = response.result.value {
                let json = JSON(value)
                let dataDict = json["data"].dictionary
                if let data = dataDict!["data"]!.arrayObject {
                    //title数组
                    var titles = [TopicTitle]()
                    //控制器数组
                    var homeTopicVCs = [LQFTopicVC]()
                    //手动添加推荐标题
                    let recommendDict = ["category":"",
                                         "name":"推荐"]
                    let recommend = TopicTitle(dict: recommendDict as [String : AnyObject])
                    titles.append(recommend)
                    //添加控制器
                    let firstVC = LQFTopicVC()
                    firstVC.topicTitle = recommend
                    homeTopicVCs.append(firstVC)
                    for dict in data {
                        //请求到的数据
                        let topicTitle = TopicTitle(dict: dict as! [String: AnyObject])
                        titles.append(topicTitle)
                        let homeTopicVC = LQFTopicVC()
                        homeTopicVC.topicTitle = topicTitle
                        homeTopicVCs.append(homeTopicVC)
                    }
                    //假想成block
                    completionHandler(titles, homeTopicVCs)
                }
            }
        }
    }
    
}
