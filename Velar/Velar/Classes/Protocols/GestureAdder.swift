//
//  GestureAdder.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/16/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

protocol GestureAdder {
    
    var delegate: PanGestureAdderDelegate? { get set }
    
    func addGesture(to view: UIView)
    
    func didPanView(recognizer: UIPanGestureRecognizer)
}
