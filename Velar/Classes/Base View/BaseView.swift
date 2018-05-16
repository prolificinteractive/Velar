//
//  BaseView.swift
//  Velar
//
//  Created by Jonathan Samudio on 1/24/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

internal class BaseView: UIView {
    
    /// Threshold to dismiss the view.
    var dismissThreshold: CGFloat = 100
    
    /// Transition speed of presenting and hideing the modal.
    var transitionSpeed: TimeInterval = 0.7
    
    /// Animates the base view when the constraints are updated.
    var viewAnimator: ViewAnimatable = ViewAnimator()
    
    /// Animates constraints that need to be updated.
    lazy var constraintAnimator: ConstraintAnimatable = {
        return ConstraintAnimator(transitionSpeed: self.transitionSpeed, viewAnimator: self.viewAnimator)
    }()
    
    /// Moves a view vertically.
    lazy var verticalMover: VerticalMovable = {
        return ViewVerticalMover(view: self,
                                 centerYConstraint: self.centerY,
                                 constraintAnimator: self.constraintAnimator)
    }()
    
    /// Adds constraints to a view and a subview.
    lazy var viewConstraintGenerator: ConstraintGenerator = {
        return ViewConstraintGenerator(view: self.modalView)
    }()
    
    /// Dismisses a view.
    lazy var modalViewDismisser: Dismissable = {
        return ModalViewDismisser(modalView: self.modalView,
                                  viewHeight: self.frame.height,
                                  dismissThreshold: self.dismissThreshold,
                                  verticalMover: self.verticalMover)
    }()
    
    /// Presents a view
    lazy var viewPresenter: Presentable = {
        return ViewPresenter(superView: self,
                             viewConstraintGenerator: self.viewConstraintGenerator,
                             verticalMover: self.verticalMover)
    }()
    
    /// Container view for the custom presentable view.
    private(set) var modalView = UIView()
    
    private weak var centerY: NSLayoutConstraint!
    
    private weak var centerX: NSLayoutConstraint!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        modalViewDismisser.viewHeight = frame.height
    }
}

private extension BaseView {

    func setupView() {
        modalView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(modalView)

        centerX = modalView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0)
        centerX.isActive = true

        centerY = modalView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        centerY.isActive = true
    }
}
