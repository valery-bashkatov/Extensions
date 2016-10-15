//
//  NSCalendarExtensionTests.swift
//  Extensions
//
//  Created by Valery Bashkatov on 10.08.16.
//  Copyright © 2016 Valery Bashkatov. All rights reserved.
//

import XCTest
import Extensions

class NSCalendarExtensionTests: XCTestCase {
    
    func testWeekFirstDay() {
        
        // First day of week of January 1, 2016 10:00:00 is December 28, 2015 10:00:00
        let calendar = NSCalendar.currentCalendar()
        calendar.firstWeekday = 2
        
        let components = NSDateComponents()
        components.year = 2016
        components.month = 1
        components.day = 1
        components.hour = 10
        let date = calendar.dateFromComponents(components)!
        let firstDate = calendar.firstDay(of: .WeekOfMonth, for: date)
        
        let correctComponents = NSDateComponents()
        correctComponents.year = 2015
        correctComponents.month = 12
        correctComponents.day = 28
        correctComponents.hour = 10
        let correctDate = calendar.dateFromComponents(correctComponents)!
        
        XCTAssert(firstDate.isEqualToDate(correctDate))
    }
    
    func testMonthLastDay() {
        
        // Last day of month of June 15, 2016 09:00:00 is June 30, 2016 09:00:00
        let calendar = NSCalendar.currentCalendar()
        calendar.firstWeekday = 2
        
        let components = NSDateComponents()
        components.year = 2016
        components.month = 6
        components.day = 15
        components.hour = 9
        let date = calendar.dateFromComponents(components)!
        let lastDate = calendar.lastDay(of: .Month, for: date)
        
        let correctComponents = NSDateComponents()
        correctComponents.year = 2016
        correctComponents.month = 6
        correctComponents.day = 30
        correctComponents.hour = 9
        let correctDate = calendar.dateFromComponents(correctComponents)!
        
        XCTAssert(lastDate.isEqualToDate(correctDate))
    }
    
    func testDatesBetween() {
        
        /*
         Dates between June 15, 2016 21:00:00 and June 17, 2016 09:00:00 with step 10 hours will be
         June 15, 2016 21:00:00,
         June 16, 2016 07:00:00,
         June 16, 2016 17:00:00,
         June 17, 2016 03:00:00
         */
        
        let calendar = NSCalendar.currentCalendar()
        calendar.firstWeekday = 2
        
        let componentsFrom = NSDateComponents()
        componentsFrom.year = 2016
        componentsFrom.month = 6
        componentsFrom.day = 15
        componentsFrom.hour = 21
        let dateFrom = calendar.dateFromComponents(componentsFrom)!
        
        let componentsTo = NSDateComponents()
        componentsTo.year = 2016
        componentsTo.month = 6
        componentsTo.day = 17
        componentsTo.hour = 9
        let dateTo = calendar.dateFromComponents(componentsTo)!
        
        let dates = calendar.datesBetween(dateFrom, and: dateTo, withStep: .Hour, value: 10)
                
        let components1 = NSDateComponents()
        components1.year = 2016
        components1.month = 6
        components1.day = 15
        components1.hour = 21
        let date1 = calendar.dateFromComponents(components1)!
        
        let components2 = NSDateComponents()
        components2.year = 2016
        components2.month = 6
        components2.day = 16
        components2.hour = 7
        let date2 = calendar.dateFromComponents(components2)!
        
        let components3 = NSDateComponents()
        components3.year = 2016
        components3.month = 6
        components3.day = 16
        components3.hour = 17
        let date3 = calendar.dateFromComponents(components3)!
        
        let components4 = NSDateComponents()
        components4.year = 2016
        components4.month = 6
        components4.day = 17
        components4.hour = 3
        let date4 = calendar.dateFromComponents(components4)!
        
        XCTAssert(dates == [date1, date2, date3, date4])
    }
}
