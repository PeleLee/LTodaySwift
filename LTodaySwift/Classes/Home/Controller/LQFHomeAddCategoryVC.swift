//
//  LQFHomeAddCategoryVC.swift
//  LTodaySwift
//
//  Created by liqunfei on 2017/9/19.
//  Copyright © 2017年 LQF. All rights reserved.
//

import UIKit
import IBAnimatable

class LQFHomeAddCategoryVC: AnimatableModalViewController {
    
    //我的频道
    var homeTitles = [TopicTitle]()
    //频道推荐数据
    var categories = [TopicTitle]()    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
