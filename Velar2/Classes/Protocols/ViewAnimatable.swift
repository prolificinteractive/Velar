//
//  ViewAnimatable.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/16/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

public protocol ViewAnimatable {
    
    func animate(duration: TimeInterval, animations: @escaping ()->(), completion: @escaping ((Bool) -> ()))
    
    func animate(duration: TimeInterval, animations: @escaping ()->())
}
