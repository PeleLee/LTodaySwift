//
//  Const.swift
//  LTodaySwift
//
//  Created by liqunfei on 2017/9/5.
//  Copyright © 2017年 LQF. All rights reserved.
//

import UIKit

/// 屏幕的宽
let screenWidth = UIScreen.main.bounds.width
/// 屏幕的高
let screenHeight = UIScreen.main.bounds.height

/// iid 未登录用户 id，只要安装了今日头条就会生成一个 iid
/// 可以在自己的手机上安装一个今日头条，然后通过 charles 抓取一下这个 iid，
/// 替换成自己的，再进行测试
let IID: String = "5034850950"
/// iid 和 device_id 好像是绑定到一起的，不对应的话获取不到数据
let device_id: String = "6096495334"


/// 服务器地址
let BASE_URL = "http://lf.snssdk.com/"


let kMargin: CGFloat = 15.0

let kNavBarHeight: CGFloat = 64.0

/// 导航栏高度
let kTabBarHeight: CGFloat = 49.0


let isNight = "isNight"
		
