//
//  ViewController.swift
//  NotificationDemo
//
//  Created by 許家旗 on 2016/10/19.
//  Copyright © 2016年 許家旗. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let myNotification = Notification.Name(rawValue: "MyNotification")

    @IBAction func showNotification(_ sender: AnyObject) {
        
        let nc = NotificationCenter.default
        
        nc.post(name: myNotification, object: nil, userInfo:["message": "您已到達運動用品區,目前公路車全面八折優惠中!"])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let nc = NotificationCenter.default
        
        nc.addObserver(forName: myNotification, object: nil, queue: nil, using: catchNotification)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func catchNotification(notification: Notification) -> Void {
        
        guard let userInfo = notification.userInfo,
            let message = userInfo["message"] as? String
            else {
            return
        }
        
        let alert = UIAlertController(title: "活動通知!", message:"\(message)", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "我知道了", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}

