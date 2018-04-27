//
//  VerticalCenterMoverTests.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import XCTest

@testable import Velar
class VerticalCenterMoverTests: XCTestCase {
    
    var sut: VerticalCenterMover!
    
    var fakeViewAnimator: FakeViewAnimator!
    
    var fakeCenterAdjuster: FakeCenterAdjuster!
    
    override func setUp() {
        super.setUp()

        sut = VerticalCenterMover(duration: 0)
        
        fakeViewAnimator = FakeViewAnimator()
        sut.viewAnimator = fakeViewAnimator
        
        fakeCenterAdjuster = FakeCenterAdjuster()
        sut.centerAdjuster = fakeCenterAdjuster
    }
    
    func testMove_Animated() {
        let view = UIView()
        let center = CGPoint(x: 5, y: 10)
        
        sut.move(view: view, center: center, animate: true)
        
        XCTAssertTrue(fakeCenterAdjuster.adjustCenterWasCalled)
        XCTAssertEqual(view.center.y, center.y)
        XCTAssertNotEqual(view.center.x, center.x)
    }
    
    func testMove_NotAnimated() {
        let view = UIView()
        let center = CGPoint(x: 5, y: 10)
        
        sut.move(view: view, center: center, animate: false)
        
        XCTAssertTrue(fakeCenterAdjuster.adjustCenterWasCalled)
        XCTAssertEqual(view.center.y, center.y)
        XCTAssertNotEqual(view.center.x, center.x)
    }
    
    func testReturnToCenter_Animated() {
        let view = UIView()
        let center = CGPoint(x: 5, y: 10)

        sut.returnToCenter(view: view, center: center, animate: true)
        
        XCTAssertEqual(sut.centerAdjuster.centerOffset, CGPoint.zero)
        XCTAssertEqual(view.center.y, center.y)
        XCTAssertNotEqual(view.center.x, center.x)
    }
    
    func testReturnToCenter_NotAnimated() {
        let view = UIView()
        let center = CGPoint(x: 5, y: 10)
        
        sut.returnToCenter(view: view, center: center, animate: false)
        
        XCTAssertEqual(sut.centerAdjuster.centerOffset, CGPoint.zero)
        XCTAssertEqual(view.center.y, center.y)
        XCTAssertNotEqual(view.center.x, center.x)
    }
}
