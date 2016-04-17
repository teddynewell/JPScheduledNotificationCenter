//
//  JPScheduledNotificationCenter.swift
//
//  Created by James on 4/16/16.
//  Copyright © 2016 Everyone. All rights reserved.
//

import UIKit

class JPScheduledNotificationCenter {
    
    static let defaultCenter = JPScheduledNotificationCenter(notificationCenter: NSNotificationCenter.defaultCenter())
    
    private var notificationCenter:NSNotificationCenter
    private var notifications:[JPScheduledNotification] = [JPScheduledNotification]()
    private var pendingNotification:JPScheduledNotification?
    private var notificationTimer:NSTimer?
    
    required init(notificationCenter: NSNotificationCenter) {
        self.notificationCenter = notificationCenter
    }
    
    private var timedNotifications = [NSNotification]()
    
    // MARK: manage notifications
    // convenience method
    func scheduleNotification(notification: NSNotification, fireDate: NSDate) {
        scheduleNotification(JPScheduledNotification(fireDate: fireDate, notification: notification))
    }
    
    // actual method
    func scheduleNotification(notification: JPScheduledNotification) {
        if let nextNotification = pendingNotification {
            if notification.fireDate.compare(nextNotification.fireDate) == .OrderedAscending {
                pendingNotification = nil
            }
        }
        
        notifications.append(notification)
        rescheduleNextNotification()
    }
    
    // cancel method
    func cancelAllNotifications() {
        notifications.removeAll()
    }
    
    // cancel one notifications
    func cancelNotification(notification:JPScheduledNotification) {
        notifications = notifications.filter { (n) -> Bool in
            n !== notification
        }
    }
    
    func cancelNotification(notification:NSNotification) {
        notifications = notifications.filter { (n) -> Bool in
            n.notification !== notification
        }
    }
    
    // MARK: internal notification management
    private func rescheduleNextNotification() {
        
        if notificationTimer != nil {
            notificationTimer!.invalidate()
            notificationTimer = nil
        }
        
        guard pendingNotification == nil else {
            // if there's already a pending notification, nothing needs to happen here
            return
        }
        
        notifications.sortInPlace { (n1, n2) -> Bool in
            // n1 is before n2?
            return n1.fireDate.compare(n2.fireDate) == .OrderedAscending
        }
        
        if let nextNotification = notifications.last {
            pendingNotification = nextNotification
            notificationTimer = NSTimer(fireDate: nextNotification.fireDate, interval: 0, target: self, selector: #selector(fireNotification), userInfo: nil, repeats: false)
            NSRunLoop.mainRunLoop().addTimer(notificationTimer!, forMode: NSRunLoopCommonModes)
        }
        
    }
    
    @objc private func fireNotification() {
        guard pendingNotification != nil else {
            // something went very wrong :(
            return
        }
        
        notificationCenter.postNotification(pendingNotification!.notification)
        
        cancelNotification(pendingNotification!)
        
        pendingNotification = nil
        
        rescheduleNextNotification()
    }
    
}
