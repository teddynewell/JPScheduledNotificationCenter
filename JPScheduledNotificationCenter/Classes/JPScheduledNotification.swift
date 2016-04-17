//
//  JPScheduledNotification.swift
//
//  Created by James on 4/16/16.
//  Copyright © 2016 Everyone. All rights reserved.
//

import UIKit

// a composition of NSNotification with a fire date
class JPScheduledNotification {
    private(set) var fireDate:NSDate
    private(set) var notification:NSNotification
    
    required init(fireDate: NSDate, name: String, object: AnyObject?, userInfo: [NSObject : AnyObject]?) {
        self.fireDate = fireDate
        self.notification = NSNotification(name: name, object: object, userInfo: userInfo)
    }
    
    convenience init(fireDate: NSDate, notification: NSNotification) {
        self.init(fireDate: fireDate, name: notification.name, object: notification.object, userInfo: notification.userInfo)
    }
}
