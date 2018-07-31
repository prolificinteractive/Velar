//
//  Direction.swift
//  Pods-Velar_Example
//
//  Created by Jonathan Samudio on 7/31/18.
//

import Foundation

/// Direction of the dismiss animation.
///
/// - top: Dismiss through the top.
/// - bottom: Dismiss throught the bottom.
public enum Direction {
    case top
    case bottom

    /// Y center offset used for the animation.
    ///
    /// - Parameter viewHeight: View height of the current view.
    /// - Returns: Center Y offset.
    func centerYOffset(viewHeight: CGFloat) -> CGFloat {
        switch self {
        case .top:
            return 0
        case .bottom:
            return viewHeight
        }
    }
    
}
