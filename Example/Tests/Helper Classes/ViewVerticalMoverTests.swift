//
//  ViewVerticalMoverTests.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import XCTest

@testable import Velar
class ViewVerticalMoverTests: XCTestCase {

    var sut: ViewVerticalMover!
    var view: UIView!
    var centerYConstraint: NSLayoutConstraint!
    var fakeConstraintAnimator: FakeConstraintAnimator!
    
    override func setUp() {
        super.setUp()
        
        view = UIView()
        centerYConstraint = NSLayoutConstraint()
        fakeConstraintAnimator = FakeConstraintAnimator()
        
        sut = ViewVerticalMover(view: view, centerYConstraint: centerYConstraint, constraintAnimator: fakeConstraintAnimator)
    }
    
    func testMoveVertical() {
        let constant: CGFloat = 10
        
        sut.move(centerYOffset: constant, animate: true, completion: nil)
        
        XCTAssertEqual(centerYConstraint.constant, constant)
        XCTAssertTrue(fakeConstraintAnimator.updateConstraintsWasCalled)
    }
}
