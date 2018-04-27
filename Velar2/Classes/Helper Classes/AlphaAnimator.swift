//
//  AlphaAnimator.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

internal final class AlphaAnimator: AlphaAnimatable {
    
    lazy var viewAnimator: ViewAnimatable = {
        return ViewAnimator()
    }()
    
    private var showAlpha: CGFloat
    
    private var hideAlpha: CGFloat
    
    private var duration: TimeInterval
    
    init(showAlpha: CGFloat, hideAlpha: CGFloat, duration: TimeInterval) {
        self.showAlpha = showAlpha
        self.hideAlpha = hideAlpha
        self.duration = duration
    }
    
    func transitionAlpha(show: Bool, view: UIView, animated: Bool, completion: (()->())?) {
        guard animated == true else {
            setAlpha(show: show, view: view)
            if let completion = completion {
                completion()
            }
            return
        }
        
        viewAnimator.animate(duration: duration, animations: { [weak self] in ()
            self?.setAlpha(show: show, view: view)
        }) { (_) in
            if let completion = completion {
                completion()
            }
        }
    }
    
    private func setAlpha(show: Bool, view: UIView) {
        view.alpha = alpha(show: show)
    }
    
    private func alpha(show: Bool) -> CGFloat {
        if show == true {
            return showAlpha
        } else {
            return hideAlpha
        }
    }
}
