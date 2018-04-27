//
//  FakeOverlayDesigner.swift
//  Velar_Example
//
//  Created by Jonathan Samudio on 4/27/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

@testable import Velar
final class FakeOverlayDesigner: BackgroundOverlayDesignable {

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
