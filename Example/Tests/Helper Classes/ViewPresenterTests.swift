//
//  ViewPresenterTests.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import XCTest

@testable import Velar
class ViewPresenterTests: XCTestCase {
    
    var sut: ViewPresenter!
    
    var superView: UIView!
    
    var fakeViewConstraintGenerator: FakeViewConstraintGenerator!
    
    var fakeViewVerticalMover: FakeViewVerticalMover!
    
    override func setUp() {
        super.setUp()
        
        superView = UIView()
        
        fakeViewConstraintGenerator = FakeViewConstraintGenerator()
        
        fakeViewVerticalMover = FakeViewVerticalMover()
        
        sut = ViewPresenter(superView: superView, viewConstraintGenerator: fakeViewConstraintGenerator, verticalMover: fakeViewVerticalMover)
    }
    
    func testPresentView_Animated() {
        let view = UIView()
        
        sut.present(view: view, animate: true)
        
        XCTAssertEqual(sut.view, view)
        XCTAssertEqual(fakeViewConstraintGenerator.constraintWasCalled, true)
        XCTAssertTrue(fakeViewVerticalMover.moveWasCalled)
    }
    
    func testPresentView_NotAnimated() {
        let view = UIView()
        
        sut.present(view: view, animate: false)
        
        XCTAssertEqual(sut.view, view)
        XCTAssertEqual(fakeViewConstraintGenerator.constraintWasCalled, true)
        XCTAssertTrue(fakeViewVerticalMover.moveWasCalled)
    }
}
