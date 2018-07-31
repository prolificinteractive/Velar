//
//  CenterAdjustable.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/16/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

protocol CenterAdjustable {
    
    /// Initial center offset.
    var centerOffset: CGPoint { get set }

    /// Sets the offset of the view.
    ///
    /// - Parameters:
    ///   - view: View to update.
    ///   - point: Point used to set.
    func setOffset(view: UIView, point: CGPoint)

    /// Adjusts the center of the view point.
    ///
    /// - Parameter center: Center point used to update the view center.
    /// - Returns: Point of the new view center.
    func adjustCenter(center: CGPoint) -> CGPoint

}
