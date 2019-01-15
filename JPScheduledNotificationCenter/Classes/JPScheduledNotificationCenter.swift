//
//  JPScheduledNotificationCenter.swift
//
//  Created by James on 4/16/16.
//  Copyright © 2016 Everyone. All rights reserved.
//

import UIKit

public class JPScheduledNotificationCenter {
    
    public static let defaultCenter = JPScheduledNotificationCenter(notificationCenter: NotificationCenter.default)
    
    private var notificationCenter: NotificationCenter
    private var notifications: [JPScheduledNotification] = []
    private var pendingNotification: JPScheduledNotification?
    private var notificationTimer: Timer?
    
    public required init(notificationCenter: NotificationCenter) {
        self.notificationCenter = notificationCenter
    }
    
    private var timedNotifications = [Notification]()
    
    // MARK: manage notifications
    // convenience method
    public func schedule(notification: Notification, fireDate: Date) {
        schedule(notification: JPScheduledNotification(fireDate: fireDate, notification: notification))
    }
    
    // actual method
    public func schedule(notification: JPScheduledNotification) {
        if let nextNotification = pendingNotification {
            if notification.fireDate.compare(nextNotification.fireDate) == .orderedAscending {
                pendingNotification = nil
            }
        }
        
        notifications.append(notification)
        rescheduleNextNotification()
    }
    
    // cancel method
    public func cancelAllNotifications() {
        pendingNotification = nil
        cancelTimer()
        notifications.removeAll()
    }
    
    // cancel one notifications
    public func cancel(notification: JPScheduledNotification) {
        
        notifications = notifications.filter { (n) -> Bool in
            n !== notification
        }
        
        if notification === pendingNotification {
            pendingNotification = nil
            rescheduleNextNotification()
        }
    }
    
    public func cancel(notification: Notification) {
        guard let existingNotification = notifications.first(where: { $0.notification == notification }) else {
            return
        }
        cancel(notification: existingNotification)
    }
    
    // MARK: internal notification management
    
    private func cancelTimer() {
        notificationTimer?.invalidate()
        notificationTimer = nil
    }
    
    private func rescheduleNextNotification() {
        
        guard pendingNotification == nil else {
            // if there's already a pending notification, nothing needs to happen here
            return
        }
        
        cancelTimer()
        
        notifications.sort { (n1, n2) -> Bool in
            // n1 is before n2?
            return n1.fireDate.compare(n2.fireDate) == .orderedAscending
        }
        
        if let nextNotification = notifications.first {
            pendingNotification = nextNotification
            notificationTimer = Timer(fireAt: nextNotification.fireDate, interval: 0, target: self, selector: #selector(fireNotification), userInfo: nil, repeats: false)
            RunLoop.main.add(notificationTimer!, forMode: .common)
        }
        
    }
    
    @objc private func fireNotification() {
        guard let next = pendingNotification else {
            return // something went very wrong :(
        }
        notificationCenter.post(next.notification)
        cancel(notification: next)
    }
    
}
