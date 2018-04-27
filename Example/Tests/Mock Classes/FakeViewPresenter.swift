//
//  FakeViewPresenter.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

@testable import Velar
class FakeViewPresenter: Presentable {
    
    var view: UIView?
    
    var presentWasCalled = false
    
    func present(view: UIView, animate: Bool) {
        presentWasCalled = true
    }
}
