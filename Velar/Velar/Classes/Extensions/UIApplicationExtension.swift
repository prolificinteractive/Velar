//
//  UIApplicationExtension.swift
//  Pods-Velar_Example
//
//  Created by Jonathan Samudio on 5/8/18.
//

import Foundation
import UIKit

extension UIApplication {

    /// The safe area insets of the application.
    ///
    /// - Returns: Edge insets of the application.
    func safeAreaInsets() -> UIEdgeInsets {
        guard let rootView = UIApplication.shared.keyWindow else {
            return UIEdgeInsets.zero
        }
        if #available(iOS 11.0, *) {
            return rootView.safeAreaInsets
        } else {
            return .zero
        }
    }

}
