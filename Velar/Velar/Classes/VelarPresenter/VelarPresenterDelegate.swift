//
//  VelarPresenterDelegate.swift
//  Velar
//
//  Created by Ruchi Jain on 6/25/18.
//  Copyright © 2018 Jonathan Samudio. All rights reserved.
//

import  Foundation

@objc public protocol VelarPresenterDelegate: class {
    
    /// Notifies delegate that velar presenter will present.
    func willPresent()
    
    /// Notifies delegate that velar presenter will dismiss.
    func willDismiss()
    
    /// Notifies delegate that velar presenter did present.
    func didPresent()
    
    /// Notifies delegate that velar presenter did dismiss.
    func didDismiss()
    
}
