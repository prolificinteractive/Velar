//
//  PanGestureAdder.swift
//  Velar
//
//  Created by Jonathan Samudio on 1/26/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

internal final class PanGestureAdder: GestureAdder {
    
    var delegate: PanGestureAdderDelegate?
    
    func addGesture(to view: UIView) {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self,
                                                      action: #selector(PanGestureAdder.didPanView))
        view.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc func didPanView(recognizer: UIPanGestureRecognizer) {
        if recognizer.state == UIGestureRecognizerState.began {
            delegate?.panBegan(recognizer: recognizer)
        } else if ((recognizer.state != UIGestureRecognizerState.ended) &&
            (recognizer.state != UIGestureRecognizerState.failed)) {
            delegate?.panUpdated(recognizer: recognizer)
        } else if recognizer.state == UIGestureRecognizerState.ended {
            delegate?.panEnded(recognizer: recognizer)
        }
    }
}
