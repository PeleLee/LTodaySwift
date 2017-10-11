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
    
    var isJoke: Bool? {
        didSet {
            girlImageView.isHidden = isJoke!
        }
    }
    
    var joke: WeitoutiaoModel? {
        didSet {
            if let content = joke?.content {
                jokeLabel.text = content as String
            }
            if joke?.comment_count == 0 {
                commentButton.setTitle("评论", for: .normal)
            }
            else {
                let str = String(describing: joke?.comment_count)
                
                commentButton.setTitle(str, for: .normal)
            }
            likeButton.setTitle(joke?.diggCount, for: .normal)
            dislikeButton.setTitle(joke?.buryCount, for: .normal)
            if let largeImage = joke?.large_image {
                if let urlStr = largeImage.url {
                    
                    let url = URL(string: urlStr)
                    
                    girlImageView.kf.setImage(with: url)
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
