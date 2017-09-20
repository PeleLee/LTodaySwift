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
        
        //请求到数据 用于展示
        NetworkTool.loadHomeTitlesData(fromViewController: String(describing:LQFHomeVC.self)) { (topTitles, homeTopicVCs) in
            for childVC in homeTopicVCs {
                self.addChildViewController(childVC)
            }
            self.setUpUI()
            
            self.pageView.titles = topTitles
            self.pageView.childVcs = self.childViewControllers as? [LQFTopicVC]
        }
    }

    //fileprivate来显式的表明，这个元素的访问权限为文件内私有
    //http://www.jianshu.com/p/604305a61e57
    
    fileprivate lazy var pageView: HomePageView = {
        let pageView = HomePageView()
        return pageView
    }()
    
    /// 导航栏
    fileprivate lazy var homeNavigationBar: HomeNavigationBar = {
        let homeNavigationBar = HomeNavigationBar()
        return homeNavigationBar
    }()

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension LQFHomeVC {
    
    fileprivate func setUpUI() {
        
        view.addSubview(pageView)
        
        pageView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(view)
            make.top.equalTo(view).offset(kNavBarHeight)
        }
        
        //添加通知的目的:待研究
        NotificationCenter.default.addObserver(self, selector: #selector(homeTitleAddButtonClicked(notification:)), name: NSNotification.Name(rawValue: "homeTitleAddButtonClicked"), object: nil)
    }
    
    //点击了加号按钮
    func homeTitleAddButtonClicked(notification: Notification) {
        let titles = notification.object as! [TopicTitle]
        
        let storyboard = UIStoryboard(name: "LQFHomeAddCategoryVC", bundle: nil)
        let homeAddCategoryVC = storyboard.instantiateViewController(withIdentifier: "LQFHomeAddCategoryVC") as! LQFHomeAddCategoryVC
        homeAddCategoryVC.homeTitles = titles
        homeAddCategoryVC.modalSize = (width: .full, height: .custom(size: Float(screenHeight - 20)))
        present(homeAddCategoryVC, animated: true, completion: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
