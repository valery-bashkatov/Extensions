//
//  UIDevice+Extension.swift
//  Extensions
//
//  Created by Valery Bashkatov on 10.08.16.
//  Copyright © 2016 Valery Bashkatov. All rights reserved.
//

import UIKit

/**
 The `UIDevice` extension for getting additional information.
 */
public extension UIDevice {

    // MARK: - Properties
    
    /// The full name of the device model. Examples: iPhone SE, iPad Air 2.
    public var fullModel: String {
        var model: String
        
        var systemInfo = utsname()
        uname(&systemInfo)
        
        let machine = systemInfo.machine
        let mirror = Mirror(reflecting: machine)
        var identifier = ""
        
        for child in mirror.children {
            if let value = child.value as? Int8, value != 0 {
                identifier.append(String(UnicodeScalar(UInt8(value))))
            }
        }
        
        switch identifier {
        case "i386", "x86_64": model = "\(self.model) Simulator"
        
        case "iPod1,1": model = "iPod Touch 1"
        case "iPod2,1": model = "iPod Touch 2"
        case "iPod3,1": model = "iPod Touch 3"
        case "iPod4,1": model = "iPod Touch 4"
        case "iPod5,1": model = "iPod Touch 5"
        case "iPod7,1": model = "iPod Touch 6"

        case "iPhone1,1": model = "iPhone"
        case "iPhone1,2": model = "iPhone 3G"
        case "iPhone2,1": model = "iPhone 3GS"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3": model = "iPhone 4"
        case "iPhone4,1": model = "iPhone 4s"
        case "iPhone5,1", "iPhone5,2": model = "iPhone 5"
        case "iPhone5,3", "iPhone5,4": model = "iPhone 5c"
        case "iPhone6,1", "iPhone6,2": model = "iPhone 5s"
        case "iPhone7,1": model = "iPhone 6 Plus"
        case "iPhone7,2": model = "iPhone 6"
        case "iPhone8,2": model = "iPhone 6s Plus"
        case "iPhone8,1": model = "iPhone 6s"
        case "iPhone8,4": model = "iPhone SE"
        case "iPhone9,1", "iPhone9,3": model = "iPhone 7"
        case "iPhone9,2", "iPhone9,4": model = "iPhone 7 Plus"
            
        case "iPad2,5", "iPad2,6", "iPad2,7": model = "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6": model = "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9": model = "iPad Mini 3"
        case "iPad5,1", "iPad5,2": model = "iPad Mini 4"
            
        case "iPad1,1", "iPad1,2": model = "iPad 1"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4": model = "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3": model = "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6": model = "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3": model = "iPad Air"
        case "iPad5,3", "iPad5,4": model = "iPad Air 2"
            
        case "iPad6,3", "iPad6,4", "iPad6,7", "iPad6,8": model = "iPad Pro"
        
        default: model = identifier
        }
        
        return model
    }
}
