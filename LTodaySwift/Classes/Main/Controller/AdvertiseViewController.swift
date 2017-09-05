//
//  AdvertiseViewController.swift
//  LTodaySwift
//
//  Created by liqunfei on 2017/8/21.
//  Copyright © 2017年 LQF. All rights reserved.
//

import UIKit

class AdvertiseViewController: UIViewController {

    //延迟2秒
    private var time: TimeInterval = 4.0
    
    private var countdownTimer: Timer?
    
    @IBOutlet weak var timeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white;
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    func updateTime() {
        if time == 0 {
            countdownTimer?.invalidate()
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let tabBarVC = sb.instantiateViewController(withIdentifier: String(describing: LqfTabBarVC.self))
            UIApplication.shared.keyWindow?.rootViewController = tabBarVC
        }
        else {
            time -= 1
            timeButton.setTitle(String(format: "%.0f s 跳过", time), for: .normal)
        }
    }

    @IBAction func timeButtonClicked(_ sender: Any) {
        countdownTimer?.invalidate()
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let tabBarVC = sb.instantiateViewController(withIdentifier: String(describing: LqfTabBarVC.self))
        UIApplication.shared.keyWindow?.rootViewController = tabBarVC
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
