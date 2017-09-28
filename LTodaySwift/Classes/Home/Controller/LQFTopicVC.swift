//
//  LQFTopicVC.swift
//  LTodaySwift
//
//  Created by liqunfei on 2017/9/6.
//  Copyright © 2017年 LQF. All rights reserved.
//

import UIKit
import MJRefresh
import SVProgressHUD
import RxSwift
import RxCocoa

class LQFTopicVC: UIViewController {

    fileprivate let disposeBag = DisposeBag()
    
    ///记录点击的顶部标题
    var topicTitle: TopicTitle?
    /// 存放新闻主题的数组
    fileprivate var newsTopics = [WeitoutiaoModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
        setupUI()
        
        if self.topicTitle!.category == "subscription" {
            tableView.tableHeaderView = toutiaohaoHearderView
        }
        
        let header = RefreshHeader {
            NetworkTool.loadHomeCategoryNewsFeed(category: self.topicTitle!.category!, completionHandler: { (nowTime, newsTopics) in
                self.tableView.mj_header.endRefreshing()
                self.newsTopics = newsTopics
                self.tableView.reloadData()
            })
        }
        
        header?.isAutomaticallyChangeAlpha = true
        header?.lastUpdatedTimeLabel.isHidden = true
        tableView.mj_header = header
        tableView.mj_header.beginRefreshing()
        
        tableView.mj_header = header
        tableView.mj_footer = MJRefreshBackNormalFooter(refreshingBlock: { 
            NetworkTool .loadHomeCategoryNewsFeed(category: self.topicTitle!.category!, completionHandler: { (nowTime, newsTopics) in
                self.tableView.mj_footer.endRefreshing()
                if newsTopics.count == 0 {
                    SVProgressHUD .setForegroundColor(UIColor.white)
                    SVProgressHUD.setBackgroundColor(UIColor(r: 0, g: 0, b: 0, alpha: 0.3))
                    SVProgressHUD.showInfo(withStatus: "没有更多新闻啦~~")
                    return
                }
                self.newsTopics += newsTopics
                self.tableView.reloadData()
            })
        })
    }
    
    fileprivate lazy var toutiaohaoHearderView: LQFTTHHeaderView = {
        let toutiaohaoHeaderView = LQFTTHHeaderView()
        toutiaohaoHeaderView.height = 56
        toutiaohaoHeaderView.delegate = self
        return toutiaohaoHeaderView
    }()
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorColor = .none
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 232
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInset = UIEdgeInsetsMake(0, 0, kTabBarHeight, 0)
        
        let nib: UINib = UINib(nibName: String(describing: HomeTopicCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: String(describing: HomeTopicCell.self))
        
        let nib2: UINib = UINib(nibName: String(describing:VideoTopicCell.self), bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: String(describing: VideoTopicCell.self))
        
        tableView.theme_backgroundColor = "colors.tableViewBackgroundColor"
        return tableView
    }()
    
}

extension LQFTopicVC: ToutiaohaoHeaderViewDelegate {
    func toutiaohaoHeaderViewMoreConcernButtonClicked() {        navigationController?.pushViewController(ConcernToutiaohaoVC(), animated: true)
    }
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
            //头条号
            return 68
        }
        else if topicTitle?.category == "essay_joke" {
            //段子
            let weitoutiao = newsTopics[indexPath.row]
            return weitoutiao.jokeCellHeight!
        }
        else if topicTitle?.category == "组图" {
            //组图
            let weitoutiao = newsTopics[indexPath.row]
            return weitoutiao.imageCellHeight!
        }
        else if topicTitle?.category == "image_ppmm" {
            //美女组图
            let weitoutiao = newsTopics[indexPath.row]
            return weitoutiao.girlCellHeight!
        }
        let weitoutiao = newsTopics[indexPath.row]
        return weitoutiao.homeCellHeight!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if topicTitle!.category == "subscription" {
            return 10
        }
        else {
            return newsTopics.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if topicTitle!.category == "video" {
            //视频
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: VideoTopicCell.self), for: indexPath) as! VideoTopicCell
            cell.videoTopic = newsTopics[indexPath.row]
            let controlEvent = UIControlEvents.touchUpInside
            cell.headCoverButton.rx.controlEvent(controlEvent).subscribe(onNext: { [weak self] in
                let userVC = LQFFollowDetailVC()
                userVC.userid = cell.videoTopic!.media_info!.user_id!
                self!.navigationController!.pushViewController(userVC, animated: true)
            })
            .addDisposableTo(disposeBag)
            
            //待
            return cell
        }
        else if topicTitle?.category == "subscription" {
            //头条号
            let nibNameStr = String(describing: LQFToutiaohaoCell.self)
            let cell = Bundle.main.loadNibNamed(nibNameStr, owner: nibNameStr, options: nil)?.last as! LQFToutiaohaoCell
            return cell
        }
        else if topicTitle?.category == "essay_joke" {
            //段子
            let nibName = String(describing: LQFHomeJokeCell.self)
            
            let cell = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)?.last as! LQFHomeJokeCell
            return cell
        }
        else if topicTitle?.category == "组图" {
            let nibName = String(describing: LQFHomeImageTableCell.self)
            let cell = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)?.last as! LQFHomeImageTableCell
            cell.homeImage = newsTopics[indexPath.row]
        }
        else if topicTitle?.category == "image_ppmm" {
            //组图
            let nibName = String(describing: LQFHomeJokeCell.self)
            let cell = Bundle.main.loadNibNamed(nibName, owner: nibName, options: nil)?.last as! LQFHomeJokeCell
            return cell
        }
       
        let nibName = String(describing: HomeTopicCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: nibName, for: indexPath) as! HomeTopicCell
        cell.weitoutiao = newsTopics[indexPath.row]
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}

