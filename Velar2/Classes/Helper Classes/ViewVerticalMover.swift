//
//  ViewVerticalMover.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

internal class ViewVerticalMover: VerticalMovable {
    
    private var view: UIView
    
    private var centerYConstraint: NSLayoutConstraint
    
    private var constraintAnimator: ConstraintAnimatable
    
    init(view: UIView, centerYConstraint: NSLayoutConstraint, constraintAnimator: ConstraintAnimatable) {
        self.view = view
        self.centerYConstraint = centerYConstraint
        self.constraintAnimator = constraintAnimator
    }
    
    func move(centerYOffset: CGFloat, animate: Bool, completion: (()->())?) {
        centerYConstraint.constant = centerYOffset
        constraintAnimator.updateConstraints(view: view, animate: animate, completion: completion)
    }
}
