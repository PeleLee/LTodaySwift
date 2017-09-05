//
//  LQFNavigationController.swift
//  LTodaySwift
//
//  Created by liqunfei on 2017/9/5.
//  Copyright © 2017年 LQF. All rights reserved.
//

import UIKit

class LQFNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = UIColor.white
        navBar.tintColor = UIColor(r: 0, g: 0, b: 0, alpha: 0.7)
        navBar.titleTextAttributes = [NSFontAttributeName : UIFont.systemFont(ofSize: 17)]
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "lefterbackicon_titlebar_24x24_"), style: .plain, target: self, action: #selector(navigationBack))
        }
    }
    
    func navigationBack() {
        self.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
