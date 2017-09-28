//
//  ThumbCollectionView.swift
//  LTodaySwift
//
//  Created by liqunfei on 2017/9/28.
//  Copyright © 2017年 LQF. All rights reserved.
//

import UIKit

class ThumbCollectionView: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        backgroundColor = UIColor.clear
        autoresizingMask = [.flexibleWidth, .flexibleWidth]
    }
    
    class func collectionViewWithFrame(frame: CGRect) -> ThumbCollectionView {
        let layout = CollectionViewFlowLayout()
        return ThumbCollectionView(frame: frame, collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        self.sectionInset = UIEdgeInsetsMake(0, 3, 3, 3)
    }
}
