//
//  NSDate+Extensions.swift
//  weather
//
//  Created by Mabo on 03/10/2016.
//  Copyright © 2016 Thanh. All rights reserved.
//

import Foundation

func <=(lhs: NSDate, rhs: NSDate) -> Bool {
  return lhs.timeIntervalSince1970 <= rhs.timeIntervalSince1970
}
func >=(lhs: NSDate, rhs: NSDate) -> Bool {
  return lhs.timeIntervalSince1970 >= rhs.timeIntervalSince1970
}
func >(lhs: NSDate, rhs: NSDate) -> Bool {
  return lhs.timeIntervalSince1970 > rhs.timeIntervalSince1970
}
func <(lhs: NSDate, rhs: NSDate) -> Bool {
  return lhs.timeIntervalSince1970 < rhs.timeIntervalSince1970
}
func ==(lhs: NSDate, rhs: NSDate) -> Bool {
  return lhs.timeIntervalSince1970 == rhs.timeIntervalSince1970
}

extension NSDate {
  
  func longDate() -> String {
    let formatter = NSDateFormatter()
    formatter.dateStyle = .LongStyle
    
    return formatter.stringFromDate(self)
  }

}
