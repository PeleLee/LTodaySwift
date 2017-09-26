//
//  LQFTTHHeaderView.swift
//  LTodaySwift
//
//  Created by liqunfei on 2017/9/25.
//  Copyright © 2017年 LQF. All rights reserved.
//

import UIKit

protocol ToutiaohaoHeaderViewDelegate {
    func toutiaohaoHeaderViewMoreConcernButtonClicked()
}

class LQFTTHHeaderView: UIView {

    var delegate: ToutiaohaoHeaderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        addSubview(moreButton)
    }
    
    fileprivate lazy var moreButton: UIButton = {
        let buttonRect = CGRect(x: 10, y: 10, width: screenWidth - 20, height: 36)
        let moreButton = UIButton(frame: buttonRect)
        moreButton.addTarget(self, action: #selector(moreConcernButtonClicked), for: .touchUpInside)
        moreButton.setTitle("关注更多头条号", for: .normal)
        moreButton.setTitleColor(UIColor(r: 230, g: 7, b: 20), for: .normal)
        moreButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        moreButton.setImage(UIImage(named: "addpgc_subscribe_16x16_"), for: .normal)
        moreButton.layer.borderColor = UIColor(r: 235, g: 235, b: 235, alpha: 1).cgColor
        moreButton.layer.borderWidth = 1
        moreButton.layer.cornerRadius = 5
        moreButton.layer.masksToBounds = true
        return moreButton
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func moreConcernButtonClicked() {
        delegate?.toutiaohaoHeaderViewMoreConcernButtonClicked()
    }
}
