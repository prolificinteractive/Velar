//
//  FakeViewVerticalMover.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

@testable import Velar
class FakeViewVerticalMover: VerticalMovable {
    
    var moveWasCalled = false
    
    func move(centerYOffset: CGFloat, animate: Bool, completion: (()->())?) {
        moveWasCalled = true
    }
}
