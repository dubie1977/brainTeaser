//
//  CustomTextField.swift
//  brainTeaser-DuBay
//
//  Created by Joseph DuBay on 9/5/16.
//  Copyright © 2016 DuBay Designs. All rights reserved.
//

import UIKit
import pop

@IBDesignable
class CustomTextField: UITextField{

    @IBInspectable var inset: CGFloat = 0
    @IBInspectable var cornerRadius: CGFloat = 5.0{
        didSet{
            setupView()
        }
    }
    
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: inset, dy: inset)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = self.cornerRadius
    }
    
}
