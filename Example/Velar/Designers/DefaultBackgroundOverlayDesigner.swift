//
//  DefaultBackgroundOverlayDesigner.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit
import Velar

final class DefaultBackgroundOverlayDesigner: BackgroundOverlayDesignable {
    
    var dismissLabelText: String {
        return "Release to Dismiss!"
    }
    
    var hideDismissLabel: Bool {
        return false
    }
    
    var dismissLabelColor: UIColor {
        return UIColor.white
    }

    var backgroundColor: UIColor {
        return UIColor.black.withAlphaComponent(0.4)
    }
}
