//
//  HomeTopicCell.swift
//  LTodaySwift
//
//  Created by liqunfei on 2017/9/25.
//  Copyright © 2017年 LQF. All rights reserved.
//

import UIKit

//protocol HomeTopicCellDelegate: class {
//    func videoheadTopicCellButtonClick(videoTopic: wei) -> <#return type#> {
//    <#function body#>
//    }
//}

class HomeTopicCell: UITableViewCell {

    /// 新闻标题
    @IBOutlet weak var newsTitleLabel: UILabel!
    /// 置顶/热
    @IBOutlet weak var hotLabel: UILabel!
    @IBOutlet weak var hotLabelWidth: NSLayoutConstraint!
    @IBOutlet weak var hotLabelLeading: NSLayoutConstraint!
    /// 专题
    @IBOutlet weak var specicalLabel: UILabel!
    @IBOutlet weak var specicalLabelLeading: NSLayoutConstraint!
    /// 用户名
    @IBOutlet weak var nameLabel: UILabel!
    /// 评论
    @IBOutlet weak var commentLabel: UILabel!
    /// 发布时间
    @IBOutlet weak var createTimeLabel: UILabel!
    
    @IBOutlet weak var middleView: UIView!
    /// 右侧按钮图片
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var rightButtonWidth: NSLayoutConstraint!
    
    @IBOutlet weak var dislikeButton: UIButton!
    @IBOutlet weak var bottomLineView: UIView!
    
    var weitoutiao: WeitoutiaoModel? {
        didSet {
        
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        hotLabel.layer.borderColor = UIColor(r: 212, g: 61, b: 61).cgColor
        hotLabel.layer.borderWidth = 0.5
        newsTitleLabel.theme_textColor = "colors.black"
        dislikeButton.theme_setImage("images.dislikeicon", forState: .normal)
        createTimeLabel.theme_textColor = "colors.mineOtherCellRightLabel"
        specicalLabel.theme_textColor = "colors.mineOtherCellRightLabel"
        bottomLineView.theme_backgroundColor = "colors.separatorColor"
        contentView.theme_backgroundColor = "colors.cellBackgroundColor"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

// MARK: - UICollectionViewDelegate
extension HomeTopicCell: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weitoutiao!.image_list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing:ThumbCollectionViewCell.self), for: indexPath) as! ThumbCollectionViewCell
//        let thumbImage = weitoutiao?.image_list[indexPath.item]
        //MARK: 待
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let imageW = (screenWidth - 2*kMargin - 2*6)/3
        let imageH = imageW*0.8
        return CGSize(width: imageW, height: imageH)
    }
}
