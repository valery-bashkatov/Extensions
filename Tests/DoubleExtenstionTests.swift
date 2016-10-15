//
//  DoubleExtenstionTests.swift
//  Extensions
//
//  Created by Valery Bashkatov on 10.08.16.
//  Copyright © 2016 Valery Bashkatov. All rights reserved.
//

import XCTest
import Extensions

class DoubleExtenstionTests: XCTestCase {
    
    func testTruncate() {
        let value: Double = 1024.0324567
        
        XCTAssert(value.truncate(toDecimalPlaces: 5) == 1024.03245)
        XCTAssert(value.truncate(toDecimalPlaces: -1) == 1020)
    }
    
    func testStringValue() {
        let value1: Double = 7.0
        let value2: Double = 764.0000000001
        
        XCTAssert(value1.string == "7")
        XCTAssert(value2.string == "764.0000000001")
    }
}