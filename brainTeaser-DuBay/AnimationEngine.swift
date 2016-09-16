//
//  AnimationEngine.swift
//  brainTeaser-DuBay
//
//  Created by Joseph DuBay on 9/6/16.
//  Copyright © 2016 DuBay Designs. All rights reserved.
//

import UIKit
import pop

class AnimationEngine{

    class var offScreenRightPosition: CGPoint{
        return CGPointMake(UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height)
    }
    
    class var offScreenLeftPosition: CGPoint{
        return CGPointMake(-UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height)
    }
    
    class var screenCenterPosition: CGPoint{
        return CGPointMake(CGRectGetMidX(UIScreen.mainScreen().bounds), CGRectGetMidY(UIScreen.mainScreen().bounds))
    }
    
    let ANIM_DELAY = 0.8
    var originalConstants = [CGFloat]()
    var constraints: [NSLayoutConstraint]!
    
    init(constraints: [NSLayoutConstraint]){
    
        for con in constraints{
            originalConstants.append(con.constant)
            con.constant = AnimationEngine.offScreenRightPosition.x
        }
        
        self.constraints = constraints
        
    }
    
    func animateOnScreen(delay: Double?){
        
        let d = delay == nil ? ANIM_DELAY * Double(NSEC_PER_SEC) : delay! * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(d))
        
        dispatch_after(time, dispatch_get_main_queue()){
            
            var index = 0
            repeat{
                let moveAnim = POPSpringAnimation(propertyNamed: kPOPLayoutConstraintConstant)
                moveAnim.toValue = self.originalConstants[index]
                moveAnim.springBounciness = 12
                moveAnim.springSpeed = 10
                
                if(index > 0){
                    moveAnim.dynamicsFriction += 10 + CGFloat(index)
                    moveAnim.dynamicsMass = 2
                }
                
                let con = self.constraints[index]
                con.pop_addAnimation(moveAnim, forKey: "moveOnScreen")
                
                index += 1
                
            }while (index < self.constraints.count)
        }
        
        
    }

}
