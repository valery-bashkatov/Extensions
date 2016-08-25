//
//  Double+Extension.swift
//  Extensions
//
//  Created by Valery Bashkatov on 10.08.16.
//  Copyright © 2016 Valery Bashkatov. All rights reserved.
//

import Foundation

/**
 The `Double` extension with various useful functions.
 */
public extension Double {
    
    // MARK: - Properties
    
    /**
     Corrected string representation of the number.
     
     ```
     1.0 -> 1 (not 1.0)
     0.00003 -> 0.00003 (not 3e-05)
     ```
     */
    public var string: String {
        let stringValue: String
        
        if trunc(self) == self {
            stringValue = "\(Int(self))"
        } else if abs(self) < 0.0001 {
            stringValue = "\(self + (self.isSignMinus ? -1 : 1))".stringByReplacingOccurrencesOfString("1.", withString: "0.")
        } else {
            stringValue = "\(self)"
        }
        
        return stringValue
    }
    
    // MARK: - Transformations

    /**
     Truncates the number up to nth decimal places.
     
     - parameter decimalPlaces: Truncation precision. Can be negative to truncate the integer part.
     
     - returns: Truncated number.
     */
    public func truncate(toDecimalPlaces decimalPlaces: Int) -> Double {
        return trunc(self * pow(10, Double(decimalPlaces))) / pow(10, Double(decimalPlaces))
    }
}