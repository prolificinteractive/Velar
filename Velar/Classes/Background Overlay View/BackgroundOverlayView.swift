//
//  BackgroundOverlayView.swift
//  Velar
//
//  Created by Jonathan Samudio on 1/25/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

internal final class BackgroundOverlayView: UIView {
    
    /// Designer for the background overlay view.
    var designer: BackgroundOverlayDesignable! {
        didSet {
            dismissLabel.text = designer.dismissLabelText
            dismissLabel.isHidden = designer.hideDismissLabel
            dismissLabel.textColor = designer.dismissLabelColor
            
            backgroundColor = designer.backgroundColor
        }
    }
    
    /// Animates alpha changes.
    lazy var alphaAnimator: AlphaAnimatable = {
        return AlphaAnimator(showAlpha: 1, hideAlpha: 0, duration: 0.25)
    }()
    
    private var dismissLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// Shows or hides the dismiss label.
    ///
    /// - Parameters:
    ///   - show: Flag to determine if the label should be shown.
    ///   - animate: Flag to determine if the transition should animate.
    func showDismissLabel(show: Bool, animate: Bool) {
        alphaAnimator.transitionAlpha(show: show, view: dismissLabel, animated: animate, completion: nil)
    }
}

private extension BackgroundOverlayView {

    func setupView() {
        dismissLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dismissLabel)

        let topOffset = 40 + UIApplication.shared.safeAreaInsets().top
        dismissLabel.topAnchor.constraint(equalTo: topAnchor, constant: topOffset).isActive = true
        dismissLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
    }
}
