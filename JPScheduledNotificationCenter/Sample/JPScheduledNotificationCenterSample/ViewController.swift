//
//  ViewController.swift
//  JPScheduledNotificationCenterSample
//
//  Created by Teddy Newell on 1/14/19.
//  Copyright © 2019 Teddy Newell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var receivedNotificationCountLabel: UILabel!
    
    private var receivedNotificationCount = 0

    private let myNotificationName = Notification.Name(rawValue: "myNotification")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        JPScheduledNotificationCenter.default.notificationCenter.addObserver(self, selector: #selector(didReceiveNotification), name: myNotificationName, object: nil)
    }

    @IBAction func scheduleNotification(_ sender: UIButton) {
        let notification = Notification(name: myNotificationName)
        JPScheduledNotificationCenter.default.schedule(notification: notification, fireDate: Date().addingTimeInterval(1))
    }
    
    @objc private func didReceiveNotification() {
        receivedNotificationCount += 1
        receivedNotificationCountLabel.text = "\(receivedNotificationCount)"
    }
    
}

