//
//  NSCalendar+Extension.swift
//  Extensions
//
//  Created by Valery Bashkatov on 10.08.16.
//  Copyright © 2016 Valery Bashkatov. All rights reserved.
//

import Foundation

/**
 The `NSCalendar` extension for getting the first/last day.
 */
public extension NSCalendar {
    
    // MARK: - Getting First and Last Day
    
    /**
     Returns the first day of a given calendar unit (year, quarter, month or week) that contains a given date.
     For example, first day of the month for June 15, 2016 will be June 1, 2016.
     
     - parameter unit: The calendar unit to use for the first day calculation.
     - parameter date: The date for which to perform the calculation.
     
     - returns: The first day of the calendar unit of the given date.
     */
    public func firstDay(of unit: NSCalendarUnit, for date: NSDate) -> NSDate {
        var firstDay: NSDate?
        
        // Getting the first day of unit
        rangeOfUnit(unit, startDate: &firstDay, interval: nil, forDate: date)
        
        // Since rangeOfUnit truncates a time, add it manually again
        let firstDayTime = components([.Hour, .Minute, .Second], fromDate: date)
        firstDay = dateByAddingComponents(firstDayTime, toDate: firstDay!, options: .MatchLast)
        
        return firstDay!
    }
    
    /**
     Returns the last day of a given calendar unit (year, quarter, month or week) that contains a given date.
     For example, last day of the week for June 15, 2016 will be June 19, 2016.
     
     - parameter unit: The calendar unit to use for the last day calculation.
     - parameter date: The date for which to perform the calculation.
     
     - returns: The last day of the calendar unit of the given date.
     */
    public func lastDay(of unit: NSCalendarUnit, for date: NSDate) -> NSDate {
        var firstDay: NSDate?
        var lastDay: NSDate?
        
        // Unit duration in seconds
        var unitDuration = NSTimeInterval()
        
        // Getting the first day of unit and unit duration in seconds
        rangeOfUnit(unit, startDate: &firstDay, interval: &unitDuration, forDate: date)
        
        // Getting the last day by moving first day on unit duration minus 1 day
        lastDay = NSDate(timeInterval: unitDuration - (60 * 60 * 24), sinceDate: firstDay!)
        
        // Since rangeOfUnit truncates a time, add it manually again
        let lastDayTime = components([.Hour, .Minute, .Second], fromDate: date)
        lastDay = dateByAddingComponents(lastDayTime, toDate: lastDay!, options: .MatchLast)
        
        return lastDay!
    }
    
    // MARK: - Getting Date Range
    
    /**
     Returns an array of dates in the interval with the specified step value. 
     For example, from June 15, 2016 to June 17, 2016 with step 1 day will be June 15, 2016, June 16, 2016 and June 17, 2016.
     
     - parameter startDate: The start date of the interval.
     - parameter finishDate: The finish date of the interval.
     - parameter unit: The step unit for the interval. The default value is day.
     - parameter value: The value for the given step unit. The default value is 1.
     
     - returns: An array of dates.
     */
    public func datesBetween(startDate: NSDate, and finishDate: NSDate, withStep unit: NSCalendarUnit = .Day, value: Int = 1) -> [NSDate] {
        var dates = [NSDate]()
        let maxOffset = components([unit], fromDate: startDate, toDate: finishDate, options: []).valueForComponent(unit)
        
        for offset in 0.stride(through: maxOffset, by: value) {
            dates.append(dateByAddingUnit(unit, value: offset, toDate: startDate, options: [])!)
        }
        
        return dates
    }
}
