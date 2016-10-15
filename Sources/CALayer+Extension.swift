//
//  CALayer+Extension.swift
//  Extensions
//
//  Created by Valery Bashkatov on 10.08.16.
//  Copyright © 2016 Valery Bashkatov. All rights reserved.
//

import UIKit

/**
 The `CALayer` extension for animations control.
 */
public extension CALayer {
    
    // MARK: - Managing Animations
    
    /**
     Adds animation with delay time.
     
     - parameter animation: The animation to be added.
     - parameter key: A string that identifies the animation.
     - parameter delay: The delay start animation.
     */
    public func addAnimation(animation: CAAnimation, forKey key: String?, withDelay delay: CGFloat) {
        animation.beginTime = convertTime(CACurrentMediaTime(), fromLayer: nil) + Double(delay)
        
        if animation.fillMode == kCAFillModeRemoved {
            animation.fillMode = kCAFillModeBackwards
        }
        
        addAnimation(animation, forKey: key)
    }
    
    /// Pauses all animations.
    public func pauseAllAnimations() {
        let pausedTime = convertTime(CACurrentMediaTime(), fromLayer: nil)
        
        speed = 0
        timeOffset = pausedTime
    }
    
    /// Resumes all animations.
    public func resumeAllAnimations() {
        let pausedTime = timeOffset
        
        speed = 1
        timeOffset = 0
        beginTime = 0
        beginTime = convertTime(CACurrentMediaTime(), toLayer: nil) - pausedTime
    }
}