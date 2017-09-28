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
            if let title = weitoutiao?.title {
                newsTitleLabel.text = String(title)
            }
            if let hot_label = weitoutiao!.label {
                if hot_label == "置顶" {
                    hotLabel.isHidden = false
                    hotLabel.text = hot_label
                }
                else if hot_label == "广告" {
                    hotLabel.isHidden = false
                    hotLabelWidth.constant = 30
                    hotLabel.text = hot_label
                    hotLabel.textColor = UIColor.globalBlueColor()
                    hotLabel.layer.cornerRadius = 3
                    hotLabel.layer.masksToBounds = true
                }
                else {
                    hotLabel.isHidden = true
                    hotLabelWidth.constant = 0
                }
                self.layoutIfNeeded()
            }
            else if let hot = weitoutiao?.hot {
                if hot {
                    hotLabel.text = "热"
                    hotLabelWidth.constant = 15
                    hotLabel.isHidden = false
                }
                else {
                    hotLabelWidth.constant = 0
                    hotLabel.isHidden = true
                }
            }
            else {
                hotLabel.isHidden = true
                hotLabelWidth.constant = 0
            }
            
            if let source = weitoutiao!.source {
                specicalLabelLeading.constant = 3
                specicalLabel.isHidden = false
                specicalLabel.text = source
            }
            else {
                specicalLabelLeading.constant = 0
                specicalLabel.isHidden = true
            }
            
            if let comment_count = weitoutiao!.comment_count {
                commentLabel.text = "\(comment_count)" + "评论"
            }
            createTimeLabel.text = weitoutiao!.createTime
            
            if let hasImage = weitoutiao!.has_image {
                if hasImage {
                    if weitoutiao!.image_list.count > 0 {
                        if weitoutiao!.image_list.count == 1 {
                            rightButton.kf.setImage(with: URL(string: weitoutiao!.image_list.first!.url!), for: .normal)
                            rightButtonWidth.constant = (screenWidth - 2*kMargin - 20)/3
                            rightButton.layoutIfNeeded()
                        }
                        else {
                            middleView.addSubview(thumbCollectionView)
                            thumbCollectionView.snp.makeConstraints({ (make) in
                                make.top.left.bottom.right.equalTo(middleView)
                            })
                        }
                    }
                    else {
                        if weitoutiao!.large_image_list.count > 0 {
                            let largeImageView = UIImageView()
                            middleView.addSubview(largeImageView)
                            largeImageView.kf.setImage(with: URL(string: weitoutiao!.large_image_list.first!.url!))
                            largeImageView.snp.makeConstraints({ (make) in
                                make.top.left.bottom.right.equalTo(self.middleView)
                            })
                        }
                        else {
                            rightButton.kf.setImage(with: URL(string: weitoutiao!.middle_image!.url!), for: .normal)
                            rightButton.width = (screenWidth - 2*kMargin - 2*6)/3
                        }
                    }
                }
                else if weitoutiao!.has_video! {
                    if let videoDetailInfo = weitoutiao!.video_detail_info {
                        videoView.imageButton.kf.setBackgroundImage(with: URL(string: videoDetailInfo.detail_video_large_image!.url!), for: .normal)
                        self.middleView.addSubview(videoView)
                        videoView.snp.makeConstraints({ (make) in
                            make.top.left.bottom.right.equalTo(self.middleView)
                        })
                    }
                }
            }
            else {
                if weitoutiao!.thumb_image_list.count != 0 {
                    self.middleView.addSubview(thumbCollectionView)
                    thumbCollectionView.snp.makeConstraints({ (make) in
                        make.top.left.bottom.right.equalTo(self.middleView)
                    })
                    
                    let imageHeight1or2 = (screenWidth - kMargin*2 - 6)*0.5
                    let imageH = (screenWidth - kMargin*2 - 12)/3
                    switch weitoutiao!.thumb_image_list.count {
                    case 1:
                        thumbCollectionView.snp.remakeConstraints({ (make) in
                            make.width.equalTo(screenWidth*0.7)
                            make.top.left.equalTo(self.middleView)
                            make.height.equalTo(imageHeight1or2)
                        })
                    case 2:
                        thumbCollectionView.height = imageHeight1or2
                    case 3:
                        thumbCollectionView.height = imageH
                    case 4...6:
                        thumbCollectionView.height = imageH*2 + 3 + 20
                    case 7...9:
                        thumbCollectionView.height = imageH*3 + 6 + 20
                    default:
                        height += 0
                    }
                }
            }
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

    private lazy var videoView: LQFCellVideoView = {
        let videoView = LQFCellVideoView.cellVieoView()
        return videoView
    }()
    
    private lazy var thumbCollectionView: ThumbCollectionView = {
        let thumbCollectionView = ThumbCollectionView.collectionViewWithFrame(frame: CGRect.zero)
        let nibName = String(describing: ThumbCollectionViewCell.self)
        let nib = UINib(nibName: nibName, bundle: nil)
        thumbCollectionView.register(nib, forCellWithReuseIdentifier: nibName)
        thumbCollectionView.isScrollEnabled = false
        thumbCollectionView.delegate = self
        thumbCollectionView.dataSource = self
        return thumbCollectionView
    }()
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
