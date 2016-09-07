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
    
    var originalConstants = [CGFloat]()
    var constraints: [NSLayoutConstraint]!
    
    init(constraints: [NSLayoutConstraint]){
    
        for con in constraints{
            originalConstants.append(con.constant)
            con.constant = AnimationEngine.offScreenRightPosition.x
        }
        
        self.constraints = constraints
        
    }
    
    func animateOnScreen(){
        var index = 0
        repeat{
            let moveAnim = POPSpringAnimation(propertyNamed: kPOPLayoutConstraintConstant)
            moveAnim.toValue = self.originalConstants[index]
            moveAnim.springBounciness = 12
            moveAnim.springSpeed = 12
            
            let con = self.constraints[index]
            con.pop_addAnimation(moveAnim, forKey: "moveOnScreen")
            
            index++
            
        }while (index < self.constraints.count)
    }

}
