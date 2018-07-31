//
//  AlphaAnimatable.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/16/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

public protocol AlphaAnimatable {

    /// Duration of the animation.
    var duration: TimeInterval { get set }
    
    /// Animates the given view.
    var viewAnimator: ViewAnimatable { get set }
    
    /// Transitions the view alpha with the properties provided.
    ///
    /// - Parameters:
    ///   - show: Flag to transition the view to show or hide.
    ///   - view: View to transition.
    ///   - animated: Determines if the interaction should be animated.
    ///   - completion: Optional completion block of the animation.
    func transitionAlpha(show: Bool, view: UIView, animated: Bool, completion: (()->())?)
    
}
