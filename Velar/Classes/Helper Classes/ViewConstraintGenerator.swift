//
//  ViewConstraintGenerator.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

internal class ViewConstraintGenerator: ConstraintGenerator {
    
    private var view: UIView
    
    init(view: UIView) {
        self.view = view
    }
    
    /// Constraints the current view to the view provided as a container view. Zero constraint constants all around the view.
    ///
    /// - parameter view:     View to add as a subview
    /// - parameter top:      Optional top constraint, default is 0
    /// - parameter leading:  Optional leading constraint, default is 0
    /// - parameter bottom:   Optional bottom constraint, default is 0
    /// - parameter trailing: Optional trailing leading constraint, default is 0
    func constraint(subView: UIView, top: CGFloat = 0, leading: CGFloat = 0, bottom: CGFloat = 0, trailing: CGFloat = 0) {
        guard subView.superview == nil else {
            return
        }
        
        subView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subView)
        
        NSLayoutConstraint(item: subView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: leading).isActive = true
        NSLayoutConstraint(item: subView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: trailing).isActive = true
        NSLayoutConstraint(item: subView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: top).isActive = true
        NSLayoutConstraint(item: subView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: bottom).isActive = true
    }
}
