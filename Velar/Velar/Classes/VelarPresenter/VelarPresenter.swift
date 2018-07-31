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

    public weak var delegate: VelarPresenterDelegate?
    
    /// Dismiss label threshold.
    public var dismissThreshold: CGFloat = 75 {
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
    public lazy var alphaAnimator: AlphaAnimatable = {
        return AlphaAnimator(showAlpha: 1, hideAlpha: 0, duration: transitionSpeed)
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
    private var offset = CGPoint.zero
    private var isAnimating = false

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
        guard !isAnimating else {
            return
        }
        
        delegate?.willPresent()
        isAnimating = true

        viewConstraintGenerator.constraint(subView: backgroundOverlayView, top: 0, leading: 0, bottom: 0, trailing: 0)
        viewConstraintGenerator.constraint(subView: baseView, top: 0, leading: 0, bottom: 0, trailing: 0)

        baseView.viewPresenter.present(view: view, animate: animate)

        alphaAnimator.transitionAlpha(show: true, view: backgroundOverlayView, animated: animate, completion: { [weak self] in ()
            self?.isAnimating = false
            self?.delegate?.didPresent()
        })
    }
    
    /// Hides the view.
    ///
    /// - Parameter animate: Flag to animate the view.
    public func hide(animate: Bool, direction: Direction = .bottom) {
        guard !isAnimating else {
            return
        }

        delegate?.willDismiss()
        isAnimating = true

        alphaAnimator.transitionAlpha(show: false, view: backgroundOverlayView, animated: animate) { [weak self] in ()
            self?.backgroundOverlayView.showDismissLabel(show: false, animate: false)
            self?.backgroundOverlayView.removeFromSuperview()
        }

        baseView.modalViewDismisser.dismiss(animate: animate, direction: direction, completion: { [weak self] in ()
            self?.isAnimating = false
            self?.baseView.viewPresenter.view?.removeFromSuperview()
            self?.baseView.removeFromSuperview()
            self?.delegate?.didDismiss()
        })
    }

}

// MARK: - PanGestureAdderDelegate
extension VelarPresenter: PanGestureAdderDelegate {
    
    func panBegan(recognizer: UIPanGestureRecognizer) {
        let location = recognizer.location(in: recognizer.view)
        offset = CGPoint(x: (recognizer.view?.bounds)!.midX - location.x, y: (recognizer.view?.bounds)!.midY - location.y)

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
        let velocity = recognizer.velocity(in: recognizer.view?.superview)
        let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
        let slideMultiplier = magnitude / 10000

        let slideFactor = 0.01 * slideMultiplier

        var finalPoint = CGPoint(x:recognizer.view!.center.x + (velocity.x * slideFactor),
                                 y:recognizer.view!.center.y + (velocity.y * slideFactor))

        finalPoint.x = min(max(finalPoint.x, 0), (recognizer.view?.superview?.bounds.size.width)!)
        finalPoint.y = min(max(finalPoint.y, 0), (recognizer.view?.superview?.bounds.size.height)!)

        UIView.animate(withDuration: Double(slideFactor * 2),
                       delay: 0,
                       options: UIViewAnimationOptions.curveEaseOut,
                       animations: {
                        recognizer.view!.center.y = finalPoint.y
        }, completion: { _ in
            guard self.baseView.modalViewDismisser.canDismiss == false else {
                self.hide(animate: true, direction: self.baseView.modalViewDismisser.direction)
                return
            }
            
            self.verticalCenterMover.returnToCenter(view: self.baseView.modalView,
                                                    center: self.baseView.center,
                                                    animate: true)
            self.backgroundOverlayView.showDismissLabel(show: self.baseView.modalViewDismisser.canDismiss, animate: true)
        })
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


