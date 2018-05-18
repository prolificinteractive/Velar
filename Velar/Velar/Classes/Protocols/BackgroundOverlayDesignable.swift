//
//  BackgroundOverlayDesignable.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/20/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

public protocol BackgroundOverlayDesignable {
    
    /// Dismiss label text.
    var dismissLabelText: String { get } 
    
    /// Flag to determine if the dismiss label should be hidden.
    var hideDismissLabel: Bool { get }
    
    /// Label text color.
    var dismissLabelColor: UIColor { get }
    
    /// Background color of the view.
    var backgroundColor: UIColor { get }
}
