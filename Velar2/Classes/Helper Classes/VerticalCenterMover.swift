//
//  VerticalCenterMover.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

internal class VerticalCenterMover: CenterMovable {
    
    lazy var centerAdjuster: CenterAdjustable = {
        return CenterAdjuster()
    }()
    
    lazy var viewAnimator: ViewAnimatable = {
        return ViewAnimator()
    }()
    
    private var duration: TimeInterval
    
    init(duration: TimeInterval) {
        self.duration = duration
    }
    
    func move(view: UIView, center: CGPoint, animate: Bool) {
        let adjustedCenter = centerAdjuster.adjustCenter(center: center)
        
        guard animate == true else {
            view.center.y = adjustedCenter.y
            return
        }
        
        viewAnimator.animate(duration: duration, animations: {
            view.center.y = adjustedCenter.y
        })
    }
    
    func returnToCenter(view: UIView, center: CGPoint, animate: Bool) {
        centerAdjuster.centerOffset = CGPoint.zero
        move(view: view, center: center, animate: animate)
    }
}
