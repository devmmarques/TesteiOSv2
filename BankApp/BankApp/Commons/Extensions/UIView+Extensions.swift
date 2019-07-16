//
//  UIView+Extensions.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 16/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import UIKit

extension UIView {
    
    func applyCellShadow(color: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 6.0, height: 6.0)
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
    }
    
    func roundCorners(corners: CACornerMask =  [.layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMinYCorner, .layerMinXMaxYCorner],
                      radius: CGFloat) {
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.maskedCorners = corners
    }
    
    func roundCorners() {
        clipsToBounds = true
        layer.cornerRadius = frame.height / 2
    }
    
    func makeCircular() {
        self.layer.cornerRadius = min(self.frame.size.height, self.frame.size.width) / 2.0
        self.clipsToBounds = true
    }
}
