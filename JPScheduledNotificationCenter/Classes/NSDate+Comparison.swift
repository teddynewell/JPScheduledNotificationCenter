//
//  NSDate+Comparison.swift
//
//  Thank you http://stackoverflow.com/questions/26807416/check-if-date-is-before-current-date-swift
//

import Foundation

extension NSDate: Comparable {}

public func <(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == .OrderedDescending
}