//
//  ViewController.swift
//  brainTeaser-DuBay
//
//  Created by Joseph DuBay on 9/5/16.
//  Copyright © 2016 DuBay Designs. All rights reserved.
//

import UIKit

class LogInVC: UIViewController {
    
    
    @IBOutlet weak var emailConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordConstraint: NSLayoutConstraint!
    @IBOutlet weak var loginConstraint: NSLayoutConstraint!
    
    var animEngine: AnimationEngine!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.animEngine = AnimationEngine(constraints: [emailConstraint, passwordConstraint, loginConstraint])
    }
    
    override func viewDidAppear(animated: Bool) {
        self.animEngine.animateOnScreen(1)
    }




}

