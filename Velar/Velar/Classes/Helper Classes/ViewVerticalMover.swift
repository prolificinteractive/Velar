//
//  ViewVerticalMover.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

final class ViewVerticalMover: VerticalMovable {

    // MARK: - Private Properties

    private var view: UIView
    
    private var centerYConstraint: NSLayoutConstraint
    
    private var constraintAnimator: ConstraintAnimatable

    // MARK: - Initialization

    init(view: UIView, centerYConstraint: NSLayoutConstraint, constraintAnimator: ConstraintAnimatable) {
        self.view = view
        self.centerYConstraint = centerYConstraint
        self.constraintAnimator = constraintAnimator
    }

    // MARK: - Public Functions
    
    func move(centerYOffset: CGFloat, animate: Bool, completion: (()->())?) {
        centerYConstraint.constant = centerYOffset
        constraintAnimator.updateConstraints(view: view, animate: animate, completion: completion)
    }

}
