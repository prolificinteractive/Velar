//
//  FakeViewAnimator.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

@testable import Velar

class FakeViewAnimator: ViewAnimatable {
    
    func animate(duration: TimeInterval, animations: @escaping ()->(), completion: @escaping ((Bool) -> ())) {
        
        animations()
        completion(true)
    }
    
    func animate(duration: TimeInterval, animations: @escaping ()->()) {
        animations()
    }
}
