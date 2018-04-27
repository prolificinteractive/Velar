//
//  UIViewExtension.swift
//  Velar_Example
//
//  Created by Jonathan Samudio on 4/27/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

extension UIView {

    /**
     Adds a shadow to the view with the incoming parameters.

     - parameter shadowColor:   Shadow color.
     - parameter shadowOffset:  Shadow offset.
     - parameter shadowOpacity: Shadow opacity.
     - parameter shadowRadius:  Shadow radius.
     */
    func addShadow(shadowColor: UIColor, shadowOffset: CGSize, shadowOpacity: Float, shadowRadius: CGFloat) {
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
}
