//
//  ConstraintGenerator.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/16/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

internal protocol ConstraintGenerator {
    
    func constraint(subView: UIView, top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat)
}
