//
//  ModalViewPresenterTests.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import XCTest

@testable import Velar
class ModalViewPresenterTests: XCTestCase {
    
    var sut: ModalViewPresenter!
    var window: UIWindow!
    
    var fakeViewPresenter: FakeViewPresenter!
    
    var fakeAlphaAnimator: FakeAlphaAnimator!
    
    override func setUp() {
        super.setUp()

        window = UIWindow()
        sut = ModalViewPresenter(parentWindow: window, designer: FakeOverlayDesigner())
        
        fakeViewPresenter = FakeViewPresenter()
        sut.baseView.viewPresenter = fakeViewPresenter
        
        fakeAlphaAnimator = FakeAlphaAnimator()
        sut.alphaAnimator = fakeAlphaAnimator
    }

    func testShowModal_Animated() {
        let view = UIView()
        
        sut.showModal(view: view, animate: true)
        
        XCTAssertEqual(sut.backgroundOverlayView.superview, window)
        XCTAssertEqual(sut.baseView.superview, window)
        XCTAssertTrue(fakeViewPresenter.presentWasCalled)
        XCTAssertTrue(fakeAlphaAnimator.transitionAlphaWasCalled)
    }
    
    func testShowModal_NotAnimated() {
        let view = UIView()
        
        sut.showModal(view: view, animate: false)
        
        XCTAssertEqual(sut.backgroundOverlayView.superview, window)
        XCTAssertEqual(sut.baseView.superview, window)
        XCTAssertTrue(fakeViewPresenter.presentWasCalled)
        XCTAssertTrue(fakeAlphaAnimator.transitionAlphaWasCalled)
    }
    
    func testHideModal_Animated() {
        
        sut.hideModal(animate: true)
        
        XCTAssertNil(sut.baseView.superview)
        XCTAssertNil(sut.baseView.viewPresenter.view?.superview)
        XCTAssertNil(sut.backgroundOverlayView.superview)
    }
    
    func testHideModal_NotAnimated() {
        
        sut.hideModal(animate: false)
        
        XCTAssertNil(sut.baseView.superview)
        XCTAssertNil(sut.baseView.viewPresenter.view?.superview)
        XCTAssertNil(sut.backgroundOverlayView.superview)
    }
}
