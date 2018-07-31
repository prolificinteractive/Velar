//
//  ModalViewDismisser.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

final class ModalViewDismisser: Dismissable {

    // MARK: - Public Properties

    var canDismissBottom: Bool {
        return  (modalView.center.y - (viewHeight / 2)) > dismissThreshold
    }

    var canDismissTop: Bool {
        return (modalView.center.y - (viewHeight / 2)) < -dismissThreshold
    }

    var viewHeight: CGFloat

    // MARK: - Private Properties

    private var modalView: UIView

    private var dismissThreshold: CGFloat
    
    private var verticalMover: VerticalMovable

    // MARK: - Initialization

    init(modalView: UIView, viewHeight: CGFloat, dismissThreshold: CGFloat, verticalMover: VerticalMovable) {
        self.modalView = modalView
        self.viewHeight = viewHeight
        self.dismissThreshold = dismissThreshold
        self.verticalMover = verticalMover
    }

    // MARK: - Public Functions
    
    func dismiss(animate: Bool, direction: Direction, completion: (()->())?) {
        verticalMover.move(centerYOffset: direction.centerYOffset(viewHeight: viewHeight),
                           animate: animate,
                           completion: completion)
    }

}



