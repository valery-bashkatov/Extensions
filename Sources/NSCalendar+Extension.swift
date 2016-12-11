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
public extension Calendar {
    
    // MARK: - Getting First and Last Day
    
    /**
     Returns the first day of a given calendar unit (year, quarter, month or week) that contains a given date.
     For example, first day of the month for June 15, 2016 will be June 1, 2016.
     
     - parameter unit: The calendar unit to use for the first day calculation.
     - parameter date: The date for which to perform the calculation.
     
     - returns: The first day of the calendar unit of the given date.
     */
    public func firstDay(of unit: Calendar.Component, for date: Date) -> Date {
        var firstDay = Date()
        var unitDuration = TimeInterval()
        
        // Getting the first day of unit
        _ = dateInterval(of: unit, start: &firstDay, interval: &unitDuration, for: date)
        
        // Since dateInterval truncates a time, add it manually again
        let firstDayTime = dateComponents([.hour, .minute, .second], from: date)
        firstDay = self.date(byAdding: firstDayTime, to: firstDay)!
        
        return firstDay
    }
    
    /**
     Returns the last day of a given calendar unit (year, quarter, month or week) that contains a given date.
     For example, last day of the week for June 15, 2016 will be June 19, 2016.
     
     - parameter unit: The calendar unit to use for the last day calculation.
     - parameter date: The date for which to perform the calculation.
     
     - returns: The last day of the calendar unit of the given date.
     */
    public func lastDay(of unit: Calendar.Component, for date: Date) -> Date {
        var firstDay = Date()
        var lastDay = Date()
        
        // Unit duration in seconds
        var unitDuration = TimeInterval()
        
        // Getting the first day of unit and unit duration in seconds
        _ = dateInterval(of: unit, start: &firstDay, interval: &unitDuration, for: date)
        
        // Getting the last day by moving first day on unit duration minus 1 day
        lastDay = Date(timeInterval: unitDuration - (60 * 60 * 24), since: firstDay)
        
        // Since dateInterval truncates a time, add it manually again
        let lastDayTime = dateComponents([.hour, .minute, .second], from: date)
        lastDay = self.date(byAdding: lastDayTime, to: lastDay)!
        
        return lastDay
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
    public func datesBetween(_ startDate: Date, and finishDate: Date, withStep unit: Calendar.Component = .day, value: Int = 1) -> [Date] {
        var dates = [Date]()
        let maxOffset = dateComponents([unit], from: startDate, to: finishDate).value(for: unit)!
        
        for offset in stride(from: 0, through: maxOffset, by: value) {
            dates.append(date(byAdding: unit, value: offset, to: startDate)!)
        }
        
        return dates
    }
}
