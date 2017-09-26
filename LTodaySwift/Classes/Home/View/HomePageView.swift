//
//  HomePageView.swift
//  LTodaySwift
//
//  Created by liqunfei on 2017/9/19.
//  Copyright © 2017年 LQF. All rights reserved.
//

import UIKit

protocol HomePageViewDelegate : class {
    func pageView(_ pageView: HomePageView, targetIndex: Int)
}

class HomePageView: UIView {

    weak var homePageDegegate: HomePageViewDelegate?
    
    fileprivate var oldIndex: Int = 0
    fileprivate var currentIndex: Int = 0
    fileprivate var startOffsetX: CGFloat = 0
    
    var titles: [TopicTitle]? {
        didSet {
            titleView.titles = titles
        }
    }
    
    var childVcs: [LQFTopicVC]? {
        didSet {
            let vc = childVcs![currentIndex]
            vc.view.frame = CGRect(x: 0, y: 0, width: collectionView.width, height: collectionView.height)
            collectionView.reloadData()
        }
    }
    
    //重写
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    fileprivate lazy var titleView: LQFHomeTitleView = {
        let titleView = LQFHomeTitleView()
        titleView.delegate = self
        return titleView
    }()
    
    fileprivate lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: screenWidth, height: screenHeight - kNavBarHeight - 40)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.orange
        collectionView.register(UINib(nibName: String(describing: LQFHomeCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: LQFHomeCollectionViewCell.self))
        collectionView.isPagingEnabled = true
        collectionView.scrollsToTop = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomePageView {
    fileprivate func setupUI() {
        backgroundColor = UIColor.white
        
        addSubview(titleView)
        addSubview(collectionView)
        
        titleView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self)
            make.height.equalTo(40)
            make.bottom.equalTo(collectionView.snp.top)
        }
        
        collectionView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(self)
        }
        
        homePageDegegate = titleView
    }
}

extension HomePageView: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: width, height: collectionView.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVcs!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: LQFHomeCollectionViewCell.self), for: indexPath) as! LQFHomeCollectionViewCell
        for subView in cell.contentView.subviews {
            subView.removeFromSuperview()
        }
        let childVC = childVcs![indexPath.item]
        childVC.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childVC.view)
        return cell
    }
}

extension HomePageView: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        contentEndScroll()
        scrollView.isScrollEnabled = true
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            contentEndScroll()
        }
        else {
            scrollView.isScrollEnabled = false
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        startOffsetX = scrollView.contentOffset.x
    }
    
    private func contentEndScroll() {
        //获取滚动到的位置
        let currentIndex = Int(collectionView.contentOffset.x / collectionView.width)
        homePageDegegate?.pageView(self, targetIndex: currentIndex)
    }
}

extension HomePageView: HomeTitleViewDelegate {
    func titleView(_ titleView: LQFHomeTitleView, targetIndex: Int) {
        currentIndex = targetIndex
        let indexPath = IndexPath(item: targetIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
    }
}
