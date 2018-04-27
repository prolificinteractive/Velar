//
//  FakeView.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

@testable import Velar
class FakeView: UIView {
    
    var layoutIfNeededWasCalled = false
    
    override func layoutIfNeeded() {
        layoutIfNeededWasCalled = true
    }
}
