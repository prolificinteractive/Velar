//
//  PanGestureAdderTests.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import XCTest

@testable import Velar
class PanGestureAdderTests: XCTestCase {
    
    var sut: PanGestureAdder!
    
    override func setUp() {
        super.setUp()

        sut = PanGestureAdder()
    }
    
    func testAddGesture() {
        let view = UIView()
        
        sut.addGesture(to: view)
        
        XCTAssertTrue(containsPanRecognizer(view: view))
    }
    
    private func containsPanRecognizer(view: UIView) -> Bool {
        guard let gestureRecognizers = view.gestureRecognizers else  {
            return false
        }
        for recognizer in gestureRecognizers {
            if let _ = recognizer as? UIPanGestureRecognizer {
                return true
            }
        }
        return false
    }
}


