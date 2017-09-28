//
//  LQFCellVideoView.swift
//  LTodaySwift
//
//  Created by liqunfei on 2017/9/28.
//  Copyright © 2017年 LQF. All rights reserved.
//

import UIKit

class LQFCellVideoView: UIView {

    @IBOutlet weak var imageButton: UIButton!
    
    class func cellVieoView() -> LQFCellVideoView {
        let nibName = String(describing: self)
        
        return Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)?.last as! LQFCellVideoView
    }

}
