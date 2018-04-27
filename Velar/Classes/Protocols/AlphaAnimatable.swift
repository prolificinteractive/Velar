//
//  AlphaAnimatable.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/16/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

public protocol AlphaAnimatable {
    
    var viewAnimator: ViewAnimatable { get set }
    
    func transitionAlpha(show: Bool, view: UIView, animated: Bool, completion: (()->())?)
}
