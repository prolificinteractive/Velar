//
//  UIViewExtension.swift
//  Velar
//
//  Created by Jonathan Samudio on 1/26/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Constraints the current view to the view provided as a container view. Zero constraint constants all around the view.
    ///
    /// - parameter view:     View to add as a subview
    /// - parameter top:      Optional top constraint, default is 0
    /// - parameter leading:  Optional leading constraint, default is 0
    /// - parameter bottom:   Optional bottom constraint, default is 0
    /// - parameter trailing: Optional trailing leading constraint, default is 0
    func constraintSubview(view: UIView, top: CGFloat = 0, leading: CGFloat = 0, bottom: CGFloat = 0, trailing: CGFloat = 0) {
        guard view.superview == nil else {
            return
        }
        
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        
        NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: leading).isActive = true
        NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: trailing).isActive = true
        NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: top).isActive = true
        NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: bottom).isActive = true
    }
    
    func addTopConstraint(toSubview view: UIView, top: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: view,
                                            attribute: .top,
                                            relatedBy: .equal,
                                            toItem: self,
                                            attribute: .top,
                                            multiplier: 1,
                                            constant: top)
        
        constraint.isActive = true
        
        return constraint
    }
    
    func constraintSize(view: UIView, width: CGFloat, height: CGFloat) {
        NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: self, attribute: .notAnAttribute, multiplier: 1, constant: height).isActive = true
        NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: self, attribute: .notAnAttribute, multiplier: 1, constant: width).isActive = true
    }
    
    /**
     Constains view provided centered to the current view.
     
     - parameter view: View to center.
     */
    func constraintSubviewCentered(view: UIView, verticalOffset: CGFloat = 0, horizontalOffset: CGFloat = 0) -> (xConstraint: NSLayoutConstraint, yConstraint: NSLayoutConstraint) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        
        let xConstraint = NSLayoutConstraint(item: view, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: horizontalOffset)
        let yConstraint = NSLayoutConstraint(item: view, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: verticalOffset)
        
        xConstraint.isActive = true
        yConstraint.isActive = true
        
        return (xConstraint, yConstraint)
    }
    
    /**
     Animates any updated constraints.
     
     - parameter transitionSpeed: Speed of the animated as a double.
     - parameter animations:      Animation closure.
     - parameter completion:      Completion closure after the animation is complete.
     */
    func animateUpdatedConstraints(transitionSpeed: Double,
                                   animations: (()->())? = nil,
                                   completion: (()->())? = nil) {
        
        UIView.animate(withDuration: transitionSpeed, animations: { [weak self] in ()
            if let animations = animations {
                animations()
            }
            self?.layoutIfNeeded()
        }) { (_) in
            if let completion = completion {
                completion()
            }
        }
    }
    
    /// Animates view alpha changes.
    ///
    /// - Parameters:
    ///   - alpha: Variable that determines the alpha of the view.
    ///   - duration: Duration of the animation.
    func animateAlpha(alpha: CGFloat, duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            self.alpha = alpha
        }
    }

}
