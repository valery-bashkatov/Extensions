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
        var calendar = Calendar.current
        calendar.firstWeekday = 2
        
        var components = DateComponents()
        components.year = 2016
        components.month = 1
        components.day = 1
        components.hour = 10
        let date = calendar.date(from: components)!
        let firstDate = calendar.firstDay(of: .weekOfMonth, for: date)
        
        var correctComponents = DateComponents()
        correctComponents.year = 2015
        correctComponents.month = 12
        correctComponents.day = 28
        correctComponents.hour = 10
        let correctDate = calendar.date(from: correctComponents)!
        
        XCTAssert(firstDate == correctDate)
    }
    
    func testMonthLastDay() {
        
        // Last day of month of June 15, 2016 09:00:00 is June 30, 2016 09:00:00
        var calendar = Calendar.current
        calendar.firstWeekday = 2
        
        var components = DateComponents()
        components.year = 2016
        components.month = 6
        components.day = 15
        components.hour = 9
        let date = calendar.date(from: components)!
        let lastDate = calendar.lastDay(of: .month, for: date)
        
        var correctComponents = DateComponents()
        correctComponents.year = 2016
        correctComponents.month = 6
        correctComponents.day = 30
        correctComponents.hour = 9
        let correctDate = calendar.date(from: correctComponents)!
        
        XCTAssert(lastDate == correctDate)
    }
    
    func testDatesBetween() {
        
        /*
         Dates between June 15, 2016 21:00:00 and June 17, 2016 09:00:00 with step 10 hours will be
         June 15, 2016 21:00:00,
         June 16, 2016 07:00:00,
         June 16, 2016 17:00:00,
         June 17, 2016 03:00:00
         */
        
        var calendar = Calendar.current
        calendar.firstWeekday = 2
        
        var componentsFrom = DateComponents()
        componentsFrom.year = 2016
        componentsFrom.month = 6
        componentsFrom.day = 15
        componentsFrom.hour = 21
        let dateFrom = calendar.date(from: componentsFrom)!
        
        var componentsTo = DateComponents()
        componentsTo.year = 2016
        componentsTo.month = 6
        componentsTo.day = 17
        componentsTo.hour = 9
        let dateTo = calendar.date(from: componentsTo)!
        
        let dates = calendar.datesBetween(dateFrom, and: dateTo, withStep: .hour, value: 10)
                
        var components1 = DateComponents()
        components1.year = 2016
        components1.month = 6
        components1.day = 15
        components1.hour = 21
        let date1 = calendar.date(from: components1)!
        
        var components2 = DateComponents()
        components2.year = 2016
        components2.month = 6
        components2.day = 16
        components2.hour = 7
        let date2 = calendar.date(from: components2)!
        
        var components3 = DateComponents()
        components3.year = 2016
        components3.month = 6
        components3.day = 16
        components3.hour = 17
        let date3 = calendar.date(from: components3)!
        
        var components4 = DateComponents()
        components4.year = 2016
        components4.month = 6
        components4.day = 17
        components4.hour = 3
        let date4 = calendar.date(from: components4)!
        
        XCTAssert(dates == [date1, date2, date3, date4])
    }
}
