//
//  VerticalMovable.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/16/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

protocol VerticalMovable {
    
    func move(centerYOffset: CGFloat, animate: Bool, completion: (()->())?)
}
