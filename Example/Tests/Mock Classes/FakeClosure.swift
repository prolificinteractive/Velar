//
//  FakeClosure.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

@testable import Velar
class FakeClosure {
    
    var completionWasCalled = false
    
    func completion() {
        completionWasCalled = true
    }
}
