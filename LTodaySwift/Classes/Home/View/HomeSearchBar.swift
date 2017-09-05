//
//  HomeSearchBar.swift
//  LTodaySwift
//
//  Created by liqunfei on 2017/9/5.
//  Copyright © 2017年 LQF. All rights reserved.
//

import UIKit

class HomeSearchBar: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let searchIcon = UIImageView()
        
        searchIcon.image       = UIImage(named: "searchicon_search_20x20_")
        searchIcon.width       = 30
        searchIcon.height      = 30
        searchIcon.contentMode = .center
        
        leftView = searchIcon
        leftViewMode = .always
    }
    
    class func searchBar() -> HomeSearchBar {
        return HomeSearchBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
