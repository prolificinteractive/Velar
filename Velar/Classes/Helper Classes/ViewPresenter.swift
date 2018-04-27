//
//  ViewPresenter.swift
//  Velar
//
//  Created by Jonathan Samudio on 2/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

internal class ViewPresenter: Presentable {
    
    var view: UIView? = nil
    
    private var viewConstraintGenerator: ConstraintGenerator
    
    private var verticalMover: VerticalMovable
    
    private var superView: UIView
    
    init(superView: UIView, viewConstraintGenerator: ConstraintGenerator, verticalMover: VerticalMovable) {
        self.viewConstraintGenerator = viewConstraintGenerator
        self.verticalMover = verticalMover
        self.superView = superView
    }
    
    func present(view: UIView, animate: Bool) {
        self.view = view
        
        viewConstraintGenerator.constraint(subView: view, top: 0, leading: 0, bottom: 0, trailing: 0)
        
        verticalMover.move(centerYOffset: superView.frame.height, animate: false, completion: nil)
        verticalMover.move(centerYOffset: 0, animate: animate, completion: nil)
    }
}
