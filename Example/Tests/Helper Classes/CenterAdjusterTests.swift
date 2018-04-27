//
//  CenterAdjusterTests.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import XCTest

@testable import Velar
class CenterAdjusterTests: XCTestCase {

    var sut: CenterAdjuster!
    
    override func setUp() {
        super.setUp()
        
        sut = CenterAdjuster()
    }
    
    func testSetOffset() {
        let view = UIView()
        view.center = CGPoint(x: 3, y: 5)
        let point = CGPoint(x: 21, y: 13)
        
        sut.setOffset(view: view, point: point)
        
        let yOffset = point.y - view.center.y
        let xOffset = point.x - view.center.x
        XCTAssertEqual(sut.centerOffset.y, yOffset)
        XCTAssertEqual(sut.centerOffset.x, xOffset)
        
    }
    
    func testAdjustCenter() {
        sut.centerOffset = CGPoint(x: 2, y: 3)
        let center = CGPoint(x: 5, y: 10)
        
        let adjustedCenter = sut.adjustCenter(center: center)
        
        let yOffset = center.y - sut.centerOffset.y
        let xOffset = center.x - sut.centerOffset.x
        XCTAssertEqual(adjustedCenter.y, yOffset)
        XCTAssertEqual(adjustedCenter.x, xOffset)
    }
}
