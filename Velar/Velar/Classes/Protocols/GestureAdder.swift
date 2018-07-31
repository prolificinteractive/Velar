//
//  GestureAdder.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/16/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

protocol GestureAdder {
    
    /// Delegate of the gesture adder.
    var delegate: PanGestureAdderDelegate? { get set }
    
    /// Adds a gesture to the view.
    ///
    /// - Parameter view: View used to add the gesture to.
    func addGesture(to view: UIView)
    
    /// Called when the view did pan.
    ///
    /// - Parameter recognizer: The current gesture recognizer that recognized the pan.
    func didPanView(recognizer: UIPanGestureRecognizer)

}
