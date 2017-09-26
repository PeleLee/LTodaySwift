//
//  RefreshHeader.swift
//  LTodaySwift
//
//  Created by liqunfei on 2017/9/26.
//  Copyright © 2017年 LQF. All rights reserved.
//

import MJRefresh

class RefreshHeader: MJRefreshGifHeader {

    override func prepare() {
        super.prepare()
        
        var images = [UIImage]()
        for index in 0..<30 {
            let image = UIImage(named: "dropdown_0\(index)")
            images.append(image!)
        }
        //设置普通状态图片
        setImages(images, for: .idle)
        
        var refreshingImages = [UIImage]()
        for index in 0..<16 {
            let image = UIImage(named: "dropdown_loading_0\(index)")
            refreshingImages.append(image!)
        }
        // 设置正在刷新状态的动画图片
        setImages(refreshingImages, for: .refreshing)
        
        //设置state状态下的文字
        setTitle("下拉推荐", for: .idle)
        setTitle("松开推荐", for: .pulling)
        setTitle("推荐中", for: .refreshing)
    }
    
    override func placeSubviews() {
        super.placeSubviews()
        gifView.contentMode = .center
        gifView.frame = CGRect(x: 0, y: 4, width: mj_w, height: 25)
        stateLabel.font = UIFont.systemFont(ofSize: 12)
        stateLabel.frame = CGRect(x: 0, y: 35, width: mj_w, height: 14)
    }
    
}
