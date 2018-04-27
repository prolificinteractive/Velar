//
//  FakeCenterAdjuster.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

@testable import Velar
class FakeCenterAdjuster: CenterAdjustable {
    
    var centerOffset = CGPoint.zero
    
    var setOffsetWasCalled = false
    
    var adjustCenterWasCalled = true
    
    func setOffset(view: UIView, point: CGPoint) {
        setOffsetWasCalled = true
    }
    
    func adjustCenter(center: CGPoint) -> CGPoint {
        adjustCenterWasCalled = true
        return center
    }

}
