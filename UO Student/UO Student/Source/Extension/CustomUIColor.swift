//
//  CustomUIColor.swift
//  UO Student
//
//  Created by Logan Poole on 12/3/17.
//  Copyright © 2017 Logan Poole. All rights reserved.
//


import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
}
