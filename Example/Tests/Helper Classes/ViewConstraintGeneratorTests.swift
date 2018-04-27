//
//  ViewConstraintGeneratorTests.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import XCTest

@testable import Velar
class ViewConstraintGeneratorTests: XCTestCase {
    
    var sut: ViewConstraintGenerator!
    var view: UIView!
    
    override func setUp() {
        super.setUp()
        
        view = UIView()
        sut = ViewConstraintGenerator(view: view)
    }
    
    func testSuperViewExit() {
        let subView = UIView()
        subView.translatesAutoresizingMaskIntoConstraints = true
        let superView = UIView()
        let constant: CGFloat = 10
        superView.addSubview(subView)
        
        sut.constraint(subView: subView, top: constant, leading: constant, bottom: constant, trailing: constant)
        
        XCTAssertEqual(subView.translatesAutoresizingMaskIntoConstraints, true)
        XCTAssertNotEqual(subView.superview, view)
        XCTAssertFalse(containsConstraint(constraints: view.constraints, attribute: .top, constant: constant))
        XCTAssertFalse(containsConstraint(constraints: view.constraints, attribute: .bottom, constant: constant))
        XCTAssertFalse(containsConstraint(constraints: view.constraints, attribute: .leading, constant: constant))
        XCTAssertFalse(containsConstraint(constraints: view.constraints, attribute: .trailing, constant: constant))
    }
    
    func testAutoResizing_False() {
        let subView = UIView()
        subView.translatesAutoresizingMaskIntoConstraints = true
        
        sut.constraint(subView: subView)
        
        XCTAssertEqual(subView.translatesAutoresizingMaskIntoConstraints, false)
    }
    
    func testAddSubView() {
        let subView = UIView()
        
        sut.constraint(subView: subView)
        
        XCTAssertEqual(subView.superview, view)
    }
    
    func testTopConstraint() {
        let subView = UIView()
        let topConstant: CGFloat = 10
        
        sut.constraint(subView: subView, top: topConstant)
        
        XCTAssertTrue(containsConstraint(constraints: view.constraints, attribute: .top, constant: topConstant))
    }
    
    func testBottomConstraint() {
        let subView = UIView()
        let bottomConstraint: CGFloat = 10
        
        sut.constraint(subView: subView, top: bottomConstraint)
        
        XCTAssertTrue(containsConstraint(constraints: view.constraints, attribute: .top, constant: bottomConstraint))
    }
    
    func testLeadingConstraint() {
        let subView = UIView()
        let leadingConstant: CGFloat = 10
        
        sut.constraint(subView: subView, top: leadingConstant)
        
        XCTAssertTrue(containsConstraint(constraints: view.constraints, attribute: .top, constant: leadingConstant))
    }
    
    func testTrailingConstraint() {
        let subView = UIView()
        let trailingConstant: CGFloat = 10
        
        sut.constraint(subView: subView, top: trailingConstant)
        
        XCTAssertTrue(containsConstraint(constraints: view.constraints, attribute: .top, constant: trailingConstant))
    }
    
    private func containsConstraint(constraints: [NSLayoutConstraint], attribute: NSLayoutAttribute, constant: CGFloat) -> Bool {
        for constraint in constraints {
            if constraint.firstAttribute == attribute &&
                constraint.secondAttribute == attribute &&
                constraint.constant == constant {
                return true
            }
        }
        return false
    }
}
