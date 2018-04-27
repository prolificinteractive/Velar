//
//  FakeAlphaAnimator.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

@testable import Velar
class FakeAlphaAnimator: AlphaAnimatable {
    
    var viewAnimator: ViewAnimatable = FakeViewAnimator()
    
    var transitionAlphaWasCalled = false
    
    func transitionAlpha(show: Bool, view: UIView, animated: Bool, completion: (()->())?) {
        transitionAlphaWasCalled = true
    }
}
