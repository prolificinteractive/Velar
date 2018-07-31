//
//  Dismissable.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/16/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation
import UIKit

protocol Dismissable {
    
    /// Determines if the view can dismiss from the bottom.
    var canDismissBottom: Bool { get }

    /// Determines if the view can dismiss from the top.
    var canDismissTop: Bool { get }

    /// View height of the container view.
    var viewHeight: CGFloat { get set }

    /// Dismisses the view with the given parameters.
    ///
    /// - Parameters:
    ///   - animate: Animates the transition.
    ///   - direction: Direction of the animation.
    ///   - completion: Optional completion block of the transition.
    func dismiss(animate: Bool, direction: Direction, completion: (()->())?)

}

extension Dismissable {

    /// Determines if the view can dismiss in either direction.
    var canDismiss: Bool {
        return canDismissBottom || canDismissTop
    }

    /// Current direction of the dismiss.
    var direction: Direction {
        if canDismissTop {
            return .top
        } else {
            return .bottom
        }
    }
    
}
