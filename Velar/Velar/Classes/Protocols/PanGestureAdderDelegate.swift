//
//  PanGestureAdderDelegate.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/16/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

protocol PanGestureAdderDelegate {
    
    func panBegan(recognizer: UIPanGestureRecognizer)
    
    func panUpdated(recognizer: UIPanGestureRecognizer)
    
    func panEnded(recognizer: UIPanGestureRecognizer)
}
