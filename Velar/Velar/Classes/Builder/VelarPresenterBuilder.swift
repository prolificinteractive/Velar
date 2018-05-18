//
//  VelarPresenterBuilder.swift
//  Pods-Velar_Example
//
//  Created by Jonathan Samudio on 4/27/18.
//

import Foundation
import UIKit

public final class VelarPresenterBuilder {

    // MARK: - Public Functions

    /// Builds the velar presenter with the current application window.
    ///
    /// - Parameter designer: Designer for the modal view.
    /// - Returns: Built model view presenter.
    public static func build(designer: BackgroundOverlayDesignable) -> VelarPresenter {
        guard let window = UIApplication.shared.delegate?.window else {
            assertionFailure("UIWindow is not instantiated.")
            return VelarPresenter(parentWindow: UIWindow(), designer: designer)
        }
        return VelarPresenter(parentWindow: window!, designer: designer)
    }

}
