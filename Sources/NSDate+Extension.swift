//
//  NSDate+Extension.swift
//  Extensions
//
//  Created by Valery Bashkatov on 25.08.16.
//  Copyright © 2016 Valery Bashkatov. All rights reserved.
//

import Foundation

/**
 The `NSDate` extension for dates formatting.
 */
public extension Date {
    
    // MARK: - Date Formatting
    
    /**
     Creates a date from a string with specified date format.
     
     Example:
     
     ```
     NSDate.create(fromString: "2016-08-25 12:03:44", 
                   format: "yyyy-MM-dd HH:mm:ss")
     ```
     
     - parameter string: A string representation of date.
     - parameter format: The date format in the string.
     
     - returns: An `NSDate` object or nil if can not parse the string.
     */
    public static func create(fromString string: String, format: String) -> Date? {
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        return formatter.date(from: string)
    }
    
    /**
     Returns a string that represents a date in a specific format.
     
     Example:
     
     ```
     NSDate().string(format: "HH:mm:ss")
     ```
     
     - parameter format: The format in which to present the date.
     
     - returns: A string representation of the date.
     */
    public func string(format: String) -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
