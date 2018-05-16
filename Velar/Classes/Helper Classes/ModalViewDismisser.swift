//
//  ModalViewDismisser.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

internal class ModalViewDismisser: Dismissable {
    
    var canDismiss: Bool {
        return  (modalView.center.y - (viewHeight / 2)) > dismissThreshold
    }

    var viewHeight: CGFloat

    private var modalView: UIView

    private var dismissThreshold: CGFloat
    
    private var verticalMover: VerticalMovable
    
    init(modalView: UIView, viewHeight: CGFloat, dismissThreshold: CGFloat, verticalMover: VerticalMovable) {
        self.modalView = modalView
        self.viewHeight = viewHeight
        self.dismissThreshold = dismissThreshold
        self.verticalMover = verticalMover
    }
    
    func dismiss(animate: Bool, completion: (()->())?) {
        verticalMover.move(centerYOffset: viewHeight, animate: animate, completion: completion)
    }
}



