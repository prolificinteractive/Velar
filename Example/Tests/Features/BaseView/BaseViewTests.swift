//
//  BaseViewTests.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import XCTest

@testable import Velar
class BaseViewTests: XCTestCase {
    
    var sut: BaseView!
    var fakeViewConstraintGenerator: FakeViewConstraintGenerator!
    var fakeViewVerticalMover: FakeViewVerticalMover!
    
    override func setUp() {
        super.setUp()

        sut = BaseView()
        
        fakeViewConstraintGenerator = FakeViewConstraintGenerator()
        sut.viewConstraintGenerator = fakeViewConstraintGenerator
        
        fakeViewVerticalMover = FakeViewVerticalMover()
        sut.verticalMover = fakeViewVerticalMover
    }

}
