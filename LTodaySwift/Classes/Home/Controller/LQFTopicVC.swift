//
//  LQFTopicVC.swift
//  LTodaySwift
//
//  Created by liqunfei on 2017/9/6.
//  Copyright © 2017年 LQF. All rights reserved.
//

import UIKit

class LQFTopicVC: UIViewController {

    //记录点击的顶部标题
    var topicTitle: TopicTitle?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
        setupUI()
        
        if self.topicTitle!.category == "subscription" {
//            tableView.tableHeaderView = t
        }
    }
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorColor = .none
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 232
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInset = UIEdgeInsetsMake(0, 0, kTabBarHeight, 0)
        return tableView
    }()
    
}

extension LQFTopicVC {
    fileprivate func setupUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(view)
        }
    }
}

// MARK: - Table view data source
extension LQFTopicVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if topicTitle?.category == "video" {
            return screenHeight * 0.4
        }
        else if topicTitle?.category == "subscription" {
            return 68
        }
        else if topicTitle?.category == "essay_joke" {
            
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}
