//
//  VelarPresenter.swift
//  Velar
//
//  Created by Jonathan Samudio on 1/23/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation
import UIKit

public final class VelarPresenter {
    
    // MARK: - Public Properties

    /// Dismiss label threshold.
    public var dismissThreshold: CGFloat = 100 {
        didSet {
           baseView.dismissThreshold = dismissThreshold
        }
    }
    
    /// Animates the modal view when showing and hiding.
    public var viewAnimator: ViewAnimatable = ViewAnimator() {
        didSet{
            baseView.viewAnimator = viewAnimator
        }
    }

    /// Animator for changing view alpha.
    public var alphaAnimator: AlphaAnimatable = {
        return AlphaAnimator(showAlpha: 1, hideAlpha: 0, duration: 0.35)
    }()
    
    /// The speed of the show and hide modal animation.
    public var transitionSpeed: TimeInterval = 0.7 {
        didSet {
            baseView.transitionSpeed = transitionSpeed
        }
    }
    
    /// Adds a gesture to the given view.
    var panGesture: GestureAdder = {
        return PanGestureAdder()
    }()

    /// Background view of the modal presenter.
    var backgroundOverlayView = BackgroundOverlayView()

    /// Base view of the modal presenter.
    lazy var baseView: BaseView = {
        let view = BaseView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backgroundViewSelected)))
        return view
    }()

    /// Adds a constraint to a view and sub view.
    lazy var viewConstraintGenerator: ConstraintGenerator = {
        return ViewConstraintGenerator(view: self.parentWindow)
    }()
    
    /// Moves an item off center and back to center.
    lazy var verticalCenterMover: CenterMovable = {
        return VerticalCenterMover(duration: 0.25)
    }()

    // MARK: - Private Properties

    private var parentWindow: UIWindow

    // MARK: - Initialization

    public init(parentWindow: UIWindow, designer: BackgroundOverlayDesignable) {
        self.parentWindow = parentWindow
        
        backgroundOverlayView.designer = designer
        
        panGesture.delegate = self
        panGesture.addGesture(to: baseView.modalView)

        alphaAnimator.transitionAlpha(show: false, view: backgroundOverlayView, animated: false, completion: nil)
        
        backgroundOverlayView.showDismissLabel(show: baseView.modalViewDismisser.canDismiss, animate: false)
    }

    // MARK: - Public Functions

    /// Shows the view.
    ///
    /// - Parameters:
    ///   - view: Custom view to present.
    ///   - animate: Flag to animate the view.
    public func show(view: UIView, animate: Bool) {
        viewConstraintGenerator.constraint(subView: backgroundOverlayView, top: 0, leading: 0, bottom: 0, trailing: 0)
        viewConstraintGenerator.constraint(subView: baseView, top: 0, leading: 0, bottom: 0, trailing: 0)

        baseView.viewPresenter.present(view: view, animate: animate)
        
        alphaAnimator.transitionAlpha(show: true, view: backgroundOverlayView, animated: animate, completion: nil)
    }
    
    /// Hides the view.
    ///
    /// - Parameter animate: Flag to animate the view.
    public func hide(animate: Bool) {
        alphaAnimator.transitionAlpha(show: false, view: backgroundOverlayView, animated: animate) { [weak self] in ()
            self?.backgroundOverlayView.showDismissLabel(show: false, animate: false)
            self?.backgroundOverlayView.removeFromSuperview()
        }
        
        baseView.modalViewDismisser.dismiss(animate: animate, completion: { [weak self] in ()
            self?.baseView.viewPresenter.view?.removeFromSuperview()
            self?.baseView.removeFromSuperview()
        })
    }

}

// MARK: - PanGestureAdderDelegate
extension VelarPresenter: PanGestureAdderDelegate {
    
    func panBegan(recognizer: UIPanGestureRecognizer) {
        let fingerCenter = recognizer.location(in: recognizer.view?.superview)
        verticalCenterMover.centerAdjuster.setOffset(view: baseView.modalView, point: fingerCenter)
        backgroundOverlayView.showDismissLabel(show: baseView.modalViewDismisser.canDismiss, animate: true)
    }
    
    func panUpdated(recognizer: UIPanGestureRecognizer) {
        let center = recognizer.location(in: recognizer.view?.superview)
        verticalCenterMover.move(view: baseView.modalView, center: center, animate: false)
        
        backgroundOverlayView.showDismissLabel(show: baseView.modalViewDismisser.canDismiss, animate: true)
    }
    
    func panEnded(recognizer: UIPanGestureRecognizer) {
        guard baseView.modalViewDismisser.canDismiss == false else {
            hide(animate: true)
            return
        }
        verticalCenterMover.returnToCenter(view: baseView.modalView, center: baseView.center, animate: true)
        backgroundOverlayView.showDismissLabel(show: baseView.modalViewDismisser.canDismiss, animate: true)
    }

}

// MARK: - Private Functions
private extension VelarPresenter {

    @objc func backgroundViewSelected(recognizer: UIGestureRecognizer) {
        if !baseView.modalView.frame.contains(recognizer.location(in: baseView)) {
            hide(animate: true)
        }
    }

}


