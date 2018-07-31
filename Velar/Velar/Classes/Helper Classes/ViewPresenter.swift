//
//  ViewPresenter.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

final class ViewPresenter: Presentable {

    // MARK: - Public Properties

    var view: UIView? = nil

    // MARK: - Private Properties

    private var viewConstraintGenerator: ConstraintGenerator
    
    private var verticalMover: VerticalMovable
    
    private weak var superView: UIView?

    // MARK: - Initialization

    init(superView: UIView?, viewConstraintGenerator: ConstraintGenerator, verticalMover: VerticalMovable) {
        self.viewConstraintGenerator = viewConstraintGenerator
        self.verticalMover = verticalMover
        self.superView = superView
    }

    // MARK: - Public Functions
    
    func present(view: UIView, animate: Bool) {
        self.view = view

        viewConstraintGenerator.constraint(subView: view, top: 0, leading: 0, bottom: 0, trailing: 0)
        
        superView?.layoutIfNeeded()
        verticalMover.move(centerYOffset: superView?.frame.height ?? 0, animate: false, completion: nil)
        verticalMover.move(centerYOffset: 0, animate: animate, completion: nil)
    }

}
