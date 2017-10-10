//
//  ThumbCollectionViewCell.swift
//  LTodaySwift
//
//  Created by liqunfei on 2017/9/25.
//  Copyright © 2017年 LQF. All rights reserved.
//

import UIKit

class ThumbCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var galleryCountLabel: UILabel!
    
    @IBOutlet weak var thumbImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbImageView.layer.borderColor = UIColor(r: 240, g: 240, b: 240).cgColor
        thumbImageView.layer.borderWidth = 1
    }

    var thumbImageURL: String? {
        didSet {
            thumbImageView.kf.setImage(with: URL(string: thumbImageURL!))
        }
    }
}
