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
    
    var canDismissBottom: Bool { get }

    var canDismissTop: Bool { get }

    var viewHeight: CGFloat { get set }

    func dismiss(animate: Bool, direction: Direction, completion: (()->())?)
}

extension Dismissable {

    var canDismiss: Bool {
        return canDismissBottom || canDismissTop
    }

    var direction: Direction {
        if canDismissTop {
            return .top
        } else {
            return .bottom
        }
    }
    
}
