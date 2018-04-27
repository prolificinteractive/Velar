//
//  BackgroundOverlayViewTests.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import XCTest

@testable import Velar
class BackgroundOverlayViewTests: XCTestCase {
    
    var sut: BackgroundOverlayView!
    var fakeAlphaAnimator: FakeAlphaAnimator!
    
    override func setUp() {
        super.setUp()

        sut = BackgroundOverlayView.instanceFromNib()
        
        fakeAlphaAnimator = FakeAlphaAnimator()
        sut.alphaAnimator = fakeAlphaAnimator
    }
    
    func testShowDismissLabel_ShowAnimated() {
        
        sut.showDismissLabel(show: true, animate: true)
        
        XCTAssertEqual(fakeAlphaAnimator.transitionAlphaWasCalled, true)
    }
    
    func testShowDismissLabel_ShowNotAnimated() {
        
        sut.showDismissLabel(show: true, animate: false)
        
        XCTAssertEqual(fakeAlphaAnimator.transitionAlphaWasCalled, true)
    }
    
    func testShowDismissLabel_HideAnimated() {
        
        sut.showDismissLabel(show: false, animate: true)
        
        XCTAssertEqual(fakeAlphaAnimator.transitionAlphaWasCalled, true)
    }
    
    func testShowDismissLabel_HideNotAnimated() {
        
        sut.showDismissLabel(show: false, animate: false)
        
        XCTAssertEqual(fakeAlphaAnimator.transitionAlphaWasCalled, true)
    }
}
