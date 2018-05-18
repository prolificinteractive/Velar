//
//  CenterAdjuster.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

final class CenterAdjuster: CenterAdjustable {

    // MARK: - Public Properties

    var centerOffset = CGPoint.zero

    // MARK: - Public Functions
    
    func setOffset(view: UIView, point: CGPoint) {
        let xOffset = point.x - view.center.x
        let yOffset = point.y - view.center.y
        centerOffset = CGPoint(x: xOffset, y: yOffset)
    }
    
    func adjustCenter(center: CGPoint) -> CGPoint {
        return CGPoint(x: center.x - centerOffset.x,
                       y: center.y - centerOffset.y)
    }

}
