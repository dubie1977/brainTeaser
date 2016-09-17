//
//  Card.swift
//  brainTeaser-DuBay
//
//  Created by Joseph DuBay on 9/15/16.
//  Copyright © 2016 DuBay Designs. All rights reserved.
//

import UIKit

class Card: UIView {

    let shapes = ["Shape 1", "Shape 2", "Shape 3"]
    
    var currentShape: String!
    
    @IBOutlet weak var shapeImage: UIImageView!
    
    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet{
            setupView()
        }
    }
    
    override func awakeFromNib() {
        setupView()
        selectShape()
    }
    
    func setupView(){
        self.layer.shadowOpacity = 8.0
        self.layer.shadowRadius = 5.0
        self.layer.shadowOffset = CGSizeMake(0.0, 2.0)
        self.layer.shadowColor = UIColor(red: 157.0/255, green: 157.0/255.0, blue: 157.0/255.0, alpha: 1.0).CGColor
        self.layer.cornerRadius = cornerRadius
        self.setNeedsLayout()
        
    }
    
    func selectShape(){
        currentShape = shapes[Int(arc4random_uniform(3))]
        shapeImage.image = UIImage(named: currentShape)
        
    }
    
    

}
