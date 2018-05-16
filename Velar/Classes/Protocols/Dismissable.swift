//
//  Dismissable.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/16/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

internal protocol Dismissable {
    
    var canDismiss: Bool { get }

    var viewHeight: CGFloat { get set }

    func dismiss(animate: Bool, completion: (()->())?)
}
