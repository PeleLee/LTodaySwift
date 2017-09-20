//
//  LQFHomeTitleView.swift
//  LTodaySwift
//
//  Created by liqunfei on 2017/9/19.
//  Copyright © 2017年 LQF. All rights reserved.
//

import UIKit

protocol HomeTitleViewDelegate: class {
    func titleView(_ titleView: LQFHomeTitleView, targetIndex: Int)
}

class LQFHomeTitleView: UIView {

    weak var delegate: HomeTitleViewDelegate?

    var titles: [TopicTitle]? {
        didSet {
            setupTitleLabels()
            setupTitleLabelsFrame()
        }
    }
    
    fileprivate lazy var currentIndex: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        theme_backgroundColor = "colors.cellBackgroundColor"
        setUpUI()
    }
    
    /// 标题数组
    fileprivate lazy var titleLabels = [LQFHomeTitleLabel]()
    
    //滚动视图
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth - 40, height: 40))
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        return scrollView
    }()
    
    /// 右侧按钮
    fileprivate lazy var rightButton: UIButton = {
        let rightButton = UIButton(frame: CGRect(x: screenWidth - 40, y: 0, width: 40, height: 40))
        rightButton.theme_setImage("images.addChannelTitlbar", forState: .normal)
        rightButton.setTitleColor(UIColor.white, for: .normal)
        rightButton.addTarget(self, action: #selector(rightButtonClicked), for: .touchUpInside)
        return rightButton
    }()
    
    /// 底部分割线
    fileprivate lazy var bottomLineView: UIView = {
        let bottomLineView = UIView(frame: CGRect(x: 0, y: 39, width: screenWidth, height: 1))
        bottomLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        return bottomLineView
    }()
    
    /// 底部滚动指示器
    fileprivate lazy var bottomLine: UIView = {
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.globalRedColor()
        bottomLine.height = 2
        bottomLine.y = 37
        return bottomLine
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LQFHomeTitleView {
    func setUpUI() {
        addSubview(scrollView)
        addSubview(rightButton)
        addSubview(bottomLineView)
        scrollView.addSubview(bottomLine)
    }
    
    fileprivate func setupTitleLabels() {
        for (index, topTitle) in titles!.enumerated() {
            let titleLabel = LQFHomeTitleLabel()
            titleLabel.text = topTitle.name
            titleLabel.font = UIFont.systemFont(ofSize: 16)
            titleLabel.tag  = index
            titleLabel.textAlignment = .center
            titleLabel.theme_textColor = index == 0 ? "colors.videoNavTitleColorSelect" : "colors.black"
            scrollView.addSubview(titleLabel)
            titleLabels.append(titleLabel)
            
            let tapGes = UITapGestureRecognizer(target: self, action: #selector(titleLabelClick(_:)))
            titleLabel.addGestureRecognizer(tapGes)
            titleLabel.isUserInteractionEnabled = true
        }
    }
    
    fileprivate func setupTitleLabelsFrame() {
        for (i, label) in titleLabels.enumerated() {
            var w: CGFloat = 0
            let h: CGFloat = 40
            var x: CGFloat = 0
            let y: CGFloat = 0
            
            let topTitle = titles![i]
            
            //根据内容获取宽度
            w = (topTitle.name! as NSString).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: 0), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName : label.font], context: nil).width
            
            if i == 0 {
                x = kMargin * 0.5
                bottomLine.x = x
                bottomLine.width = w
            }
            else {
                let preLabel = titleLabels[i - 1]
                x = preLabel.frame.maxX + kMargin
            }
            label.frame = CGRect(x: x, y: y, width: w, height: h)
        }
        scrollView.contentSize = CGSize(width: titleLabels.last!.frame.maxX + kMargin * 0.5, height: 0)
    }
}

// MARK: - 监听事件
extension LQFHomeTitleView {
    
    @objc fileprivate func titleLabelClick(_ tapGes: UITapGestureRecognizer) {
        /// 用户点击的label
        let targetLabel = tapGes.view as! LQFHomeTitleLabel
        
        adjustTitleLabel(targetIndex: targetLabel.tag)
        
        //调整bottomLine
        UIView.animate(withDuration: 0.25) {
            self.bottomLine.width = targetLabel.width
            self.bottomLine.centerX = targetLabel.centerX
        }
        
        //通知代理
        delegate?.titleView(self, targetIndex: currentIndex)
    }
    
    fileprivate func adjustTitleLabel(targetIndex: Int) {
        if targetIndex == currentIndex {return}
        
        let targetLabel = titleLabels[targetIndex]
        let sourceLabel = titleLabels[currentIndex]
        
        //切换文字颜色
        targetLabel.textColor = UIColor.globalRedColor()
        sourceLabel.textColor = UIColor(r: 0, g: 0, b: 0, alpha: 0.7)
        sourceLabel.currentScale = 1.0
        targetLabel.currentScale = 1.1
        
        //记录下标值
        currentIndex = targetIndex
        
        //调整位置
        //当前偏移量
        var offSetX = targetLabel.centerX - scrollView.width * 0.5
        if offSetX < 0 {
            offSetX = 0
        }
        //最大偏移量
        var maxOffsetX = scrollView.contentSize.width - scrollView.width
        
        if maxOffsetX < 0 {
            maxOffsetX = 0
        }
        
        if offSetX > maxOffsetX {
            offSetX = maxOffsetX
        }
        scrollView.setContentOffset(CGPoint(x: offSetX, y: 0), animated: true)
    }
    
    /// 右侧按钮点击
    @objc fileprivate func rightButtonClicked() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "homeTitleAddButtonClicked"), object: titles)
    }
}

extension LQFHomeTitleView: HomePageViewDelegate {
    func pageView(_ pageView: HomePageView, targetIndex: Int) {
        adjustTitleLabel(targetIndex: targetIndex)
    }
}

private class LQFHomeTitleLabel: UILabel {
    /// 记录当前label的缩放比例
    var currentScale: CGFloat = 1.0 {
        didSet {
            transform = CGAffineTransform(scaleX: currentScale, y: currentScale)
        }
    }
}
