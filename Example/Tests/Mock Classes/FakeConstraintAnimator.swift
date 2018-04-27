//
//  FakeConstraintAnimator.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

@testable import Velar
class FakeConstraintAnimator: ConstraintAnimatable {
    
    var updateConstraintsWasCalled = false
    
    func updateConstraints(view: UIView, animate: Bool, completion: (()->())?) {
        updateConstraintsWasCalled = true
    }
}
