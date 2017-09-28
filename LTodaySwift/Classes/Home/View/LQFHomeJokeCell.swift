//
//  LQFHomeJokeCell.swift
//  LTodaySwift
//
//  Created by liqunfei on 2017/9/28.
//  Copyright © 2017年 LQF. All rights reserved.
//

import UIKit

class LQFHomeJokeCell: UITableViewCell {

    @IBOutlet weak var girlImageView: UIImageView!
    
    @IBOutlet weak var jokeLabel: UILabel!
    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var dislikeButton: UIButton!
    
    @IBOutlet weak var commentButton: UIButton!
    
    @IBOutlet weak var starButton: UIButton!
    
    @IBOutlet weak var shareButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
