# JPScheduledNotificationCenter

[![CI Status](http://img.shields.io/travis/JamesPerlman/JPScheduledNotificationCenter.svg?style=flat)](https://travis-ci.org/JamesPerlman/JPScheduledNotificationCenter)
[![Version](https://img.shields.io/cocoapods/v/JPScheduledNotificationCenter.svg?style=flat)](http://cocoapods.org/pods/JPScheduledNotificationCenter)
[![License](https://img.shields.io/cocoapods/l/JPScheduledNotificationCenter.svg?style=flat)](http://cocoapods.org/pods/JPScheduledNotificationCenter)
[![Platform](https://img.shields.io/cocoapods/p/JPScheduledNotificationCenter.svg?style=flat)](http://cocoapods.org/pods/JPScheduledNotificationCenter)

## Usage

A Scheduled NSNotification manager.  Solution to http://stackoverflow.com/questions/36670453/scheduled-nsnotification-instead-of-uilocalnotification-swift-solutions

Example usage: 

```swift
let fiveMinsFromNow = NSDate(timeIntervalSinceNow: 5 * 60)
let notification = NSNotification(name: "FiveMinutesHaveElapsed", object: nil, userInfo: nil)
JPScheduledNotificationCenter.defaultCenter.scheduleNotification(notification, fireDate: fiveMinsFromNow)
```

This will dispatch a "FiveMinutesHaveElapsed" notification approximately five minutes from the time that code executed.


## Requirements

## Installation

JPScheduledNotificationCenter is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "JPScheduledNotificationCenter"
```

## Author

James Perlman

## License

JPScheduledNotificationCenter is available under the MIT license. See the LICENSE file for more info.
