//
//  LQFToutiaohaoCell.swift
//  LTodaySwift
//
//  Created by liqunfei on 2017/9/27.
//  Copyright © 2017年 LQF. All rights reserved.
//

import UIKit

class LQFToutiaohaoCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var concernNameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var badgeLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
