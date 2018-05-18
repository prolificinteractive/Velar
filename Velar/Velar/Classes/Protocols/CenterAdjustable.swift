//
//  CenterAdjustable.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/16/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

protocol CenterAdjustable {
    
    var centerOffset: CGPoint { get set }
    
    func setOffset(view: UIView, point: CGPoint)
    
    func adjustCenter(center: CGPoint) -> CGPoint
}
