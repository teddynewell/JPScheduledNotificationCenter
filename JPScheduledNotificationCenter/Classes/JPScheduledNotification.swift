//
//  JPScheduledNotification.swift
//
//  Created by James on 4/16/16.
//  Copyright © 2016 Everyone. All rights reserved.
//

import UIKit

// a composition of NSNotification with a fire date
public class JPScheduledNotification {
    public private(set) var fireDate: Date
    public private(set) var notification: Notification
    
    public convenience init(fireDate: Date, name: String, object: Any?, userInfo: [AnyHashable : Any]?) {
        let notification = Notification(name: Notification.Name(rawValue: name), object: object, userInfo: userInfo)
        self.init(fireDate: fireDate, notification: notification)
    }
    
    public required init(fireDate: Date, notification: Notification) {
        self.fireDate = fireDate
        self.notification = notification
    }
}
