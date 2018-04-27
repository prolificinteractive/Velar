//
//  Presentable.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/16/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

internal protocol Presentable {
    
    var view: UIView? { get set }
    
    func present(view: UIView, animate: Bool)
}
