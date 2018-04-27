//
//  FakeViewConstraintGenerator.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

@testable import Velar
class FakeViewConstraintGenerator: ConstraintGenerator {
    
    var constraintWasCalled = false
    
    func constraint(subView: UIView, top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat) {
        constraintWasCalled = true
    }  
}
