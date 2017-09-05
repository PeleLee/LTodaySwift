//
//  LQFHomeVC.swift
//  LTodaySwift
//
//  Created by liqunfei on 2017/9/5.
//  Copyright © 2017年 LQF. All rights reserved.
//

import UIKit

class LQFHomeVC: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //导航栏颜色
        navigationController?.navigationBar.theme_barTintColor = "colors.homeNavBarTintColor"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.globalBackgroundColor()
        //设置状态栏属性
        navigationController?.navigationBar.barStyle = .black
        //自定义导航栏
        navigationItem.titleView = homeNavigationBar
        
        automaticallyAdjustsScrollViewInsets = false
    }

    fileprivate lazy var homeNavigationBar: HomeNavigationBar = {
        let homeNavigationBar = HomeNavigationBar()
        return homeNavigationBar
    }()

}
