//
//  JPScheduledNotification.swift
//
//  Created by James on 4/16/16.
//  Copyright © 2016 Everyone. All rights reserved.
//

import UIKit

// a composition of NSNotification with a fire date
public class JPScheduledNotification {
    public private(set) var fireDate:NSDate
    public private(set) var notification:NSNotification
    
    public required init(fireDate: NSDate, name: String, object: AnyObject?, userInfo: [NSObject : AnyObject]?) {
        self.fireDate = fireDate
        self.notification = NSNotification(name: name, object: object, userInfo: userInfo)
    }
    
    public convenience init(fireDate: NSDate, notification: NSNotification) {
        self.init(fireDate: fireDate, name: notification.name, object: notification.object, userInfo: notification.userInfo)
    }
}
