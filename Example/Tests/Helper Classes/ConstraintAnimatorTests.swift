//
//  ConstraintAnimatorTests.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import XCTest

@testable import Velar
class ConstraintAnimatorTests: XCTestCase {
    
    var sut: ConstraintAnimator!
    var fakeViewAnimator: FakeViewAnimator!
    
    override func setUp() {
        super.setUp()
        
        fakeViewAnimator = FakeViewAnimator()
        
        sut = ConstraintAnimator(transitionSpeed: 0, viewAnimator: fakeViewAnimator)
    }
    
    func testUpdateConstraints_Animate() {
        let view = FakeView()
        let closure = FakeClosure()
        
        sut.updateConstraints(view: view, animate: true, completion: closure.completion)
        
        XCTAssertTrue(view.layoutIfNeededWasCalled)
        XCTAssertTrue(closure.completionWasCalled)
    }
    
    func testUpdateConstraints_DoNotAnimate() {
        let view = FakeView()
        let closure = FakeClosure()
        
        sut.updateConstraints(view: view, animate: false, completion: closure.completion)
        
        XCTAssertTrue(view.layoutIfNeededWasCalled)
        XCTAssertTrue(closure.completionWasCalled)
    }
}
