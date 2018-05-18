//
//  CenterMovable.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/16/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

protocol CenterMovable {
    
    var centerAdjuster: CenterAdjustable { get }
    
    func move(view: UIView, center: CGPoint, animate: Bool)
    
    func returnToCenter(view: UIView, center: CGPoint, animate: Bool)
}
