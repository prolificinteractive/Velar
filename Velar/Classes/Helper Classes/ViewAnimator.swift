//
//  ViewAnimator.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

public class ViewAnimator: ViewAnimatable {
    
    public func animate(duration: TimeInterval, animations: @escaping ()->(), completion: @escaping ((Bool) -> ())) {
        UIView.animate(withDuration: duration,
                       delay: 0,
                       usingSpringWithDamping: 0.75,
                       initialSpringVelocity: 1,
                       options: .curveEaseIn,
                       animations: animations,
                       completion: completion)
    }
    
    public func animate(duration: TimeInterval, animations: @escaping ()->()) {
        UIView.animate(withDuration: duration,
                       delay: 0,
                       usingSpringWithDamping: 0.75,
                       initialSpringVelocity: 1,
                       options: .curveEaseIn,
                       animations: animations)
    }
}
