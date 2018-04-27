//
//  AlphaAnimatorTests.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import XCTest

@testable import Velar
class AlphaAnimatorTests: XCTestCase {
    
    var sut: AlphaAnimator!
    var fakeViewAnimator: FakeViewAnimator!

    override func setUp() {
        super.setUp()
        
        fakeViewAnimator = FakeViewAnimator()
    }
    
    func testTransitionAlpha_ShowAnimated() {
        let showAlpha: CGFloat = 1
        let view = UIView()
        let closure = FakeClosure()
        view.alpha = 0.5
        sut = AlphaAnimator(showAlpha: showAlpha, hideAlpha: 0, duration: 0)
        sut.viewAnimator = fakeViewAnimator

        sut.transitionAlpha(show: true, view: view, animated: true, completion: closure.completion)
        
        XCTAssertEqual(view.alpha, showAlpha)
        XCTAssertTrue(closure.completionWasCalled)
    }
    
    func testTransitionAlpha_ShowNotAnimated() {
        let showAlpha: CGFloat = 1
        let view = UIView()
        let closure = FakeClosure()
        view.alpha = 0.5
        sut = AlphaAnimator(showAlpha: showAlpha, hideAlpha: 0, duration: 0)
        
        sut.transitionAlpha(show: true, view: view, animated: false, completion: closure.completion)
        
        XCTAssertEqual(view.alpha, showAlpha)
        XCTAssertTrue(closure.completionWasCalled)
    }
    
    func testTransitionAlpha_HideAnimated() {
        let hideAlpha: CGFloat = 0
        let view = UIView()
        let closure = FakeClosure()
        view.alpha = 0.5
        sut = AlphaAnimator(showAlpha: 1, hideAlpha: hideAlpha, duration: 0)
        sut.viewAnimator = fakeViewAnimator
        
        sut.transitionAlpha(show: false, view: view, animated: true, completion: closure.completion)
        
        XCTAssertEqual(view.alpha, hideAlpha)
        XCTAssertTrue(closure.completionWasCalled)
    }
    
    
    func testTransitionAlpha_HideNotAnimated() {
        let hideAlpha: CGFloat = 0
        let view = UIView()
        let closure = FakeClosure()
        view.alpha = 0.5
        sut = AlphaAnimator(showAlpha: 1, hideAlpha: hideAlpha, duration: 0)
        
        sut.transitionAlpha(show: false, view: view, animated: false, completion: closure.completion)
        
        XCTAssertEqual(view.alpha, hideAlpha)
        XCTAssertTrue(closure.completionWasCalled)
    }
}
