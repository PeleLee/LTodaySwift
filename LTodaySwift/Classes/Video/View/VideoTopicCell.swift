//
//  VideoTopicCell.swift
//  LTodaySwift
//
//  Created by liqunfei on 2017/9/26.
//  Copyright © 2017年 LQF. All rights reserved.
//

import UIKit
import Kingfisher

class VideoTopicCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var playCountLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var bgImageButton: UIButton!
    
    @IBOutlet weak var headButton: UIButton!

    @IBOutlet weak var headCoverButton: UIButton!
    
    @IBOutlet weak var nameLable: UILabel!
    
    @IBOutlet weak var concernButton: UIButton!
    
    @IBOutlet weak var commentButton: UIButton!
    
    @IBOutlet weak var moreButton: UIButton!
    
    @IBOutlet weak var bottomLineView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        headButton.layer.cornerRadius = 15
        headButton.layer.masksToBounds = true
        contentView.theme_backgroundColor = "colors.cellBackgroundColor"
        titleLabel.theme_textColor = "colors.black"
        nameLable.theme_textColor = "colors.black"
        commentButton.theme_setTitleColor("colors.black", forState: .normal)
        concernButton.theme_setTitleColor("colors.black", forState: .normal)
        bottomLineView.theme_backgroundColor = "colors.separatorColor"
        playCountLabel.theme_textColor = "colors.playCountColor"
        concernButton.theme_setImage("images.videoConcernButton", forState: .normal)
        moreButton.theme_setImage("images.videoMoreButton", forState: .normal)
        bgImageButton.theme_setImage("images.videoBgImageButton", forState: .normal)
    }

    var videoTopic: WeitoutiaoModel? {
        didSet {
            let url = URL(string: (videoTopic!.video_detail_info?.detail_video_large_image?.url!)!)
            bgImageButton.kf.setBackgroundImage(with: url, for: .normal)
            
            titleLabel.text = String(describing: videoTopic!.title!)
            
            if let user_info = videoTopic!.user_info {
                let url2 = URL(string: user_info.avatar_url!)
                headButton.kf.setImage(with: url2!, for: .normal)
            }
            
            if videoTopic?.comment_count! == 0 {
                commentButton.setTitle("评论", for: .normal)
            }
            else {
                commentButton.setTitle(String(describing: videoTopic?.comment_count!), for: .normal)
            }
            
            playCountLabel.text = videoTopic!.readCount! + "次播放"
            timeLabel.text = videoTopic!.video_duration!
        }
    }
    
    
    @IBAction func bgImageButtonClick(_ sender: UIButton) {
        print("待补充")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
