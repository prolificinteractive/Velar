//
//  ModalViewDismisserTests.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import XCTest

@testable import Velar
class ModalViewDismisserTests: XCTestCase {
    
    var sut: ModalViewDismisser!
    
    var modalView: UIView!
    
    var viewHeight: CGFloat!
    
    var dimissThreshold: CGFloat!
    
    var fakeViewVerticalMover: FakeViewVerticalMover!
    
    override func setUp() {
        super.setUp()
        
        modalView = UIView()
        
        viewHeight = 500
        
        dimissThreshold = 100
        
        fakeViewVerticalMover = FakeViewVerticalMover()
        
        sut = ModalViewDismisser(modalView: modalView,
                                 viewHeight: viewHeight,
                                 dismissThreshold: dimissThreshold,
                                 verticalMover: fakeViewVerticalMover)
    }
    
    func testDismiss() {
        
        sut.dismiss(animate: true, completion: nil)
        
        XCTAssertTrue(fakeViewVerticalMover.moveWasCalled)
    }
    
    func testCanDismiss_WithinThreshold() {
        modalView.center = CGPoint(x: 0, y: 50)
        
        let actual = sut.canDismiss
        
        XCTAssertFalse(actual)
    }
    
    func testCanDismiss_OutsideThreshold() {
        modalView.center = CGPoint(x: 0, y: 400)
        
        let actual = sut.canDismiss
        
        XCTAssertTrue(actual)
    }
}
