//
//  ModelViewBuilder.swift
//  Pods-Velar_Example
//
//  Created by Jonathan Samudio on 4/27/18.
//

import Foundation

public final class ModelViewBuilder {

    /// Builds the model view presenter with the current application window.
    ///
    /// - Parameter designer: Designer for the modal view.
    /// - Returns: Built model view presenter.
    public static func build(designer: BackgroundOverlayDesignable) -> ModalViewPresenter {
        guard let window = UIApplication.shared.delegate?.window else {
            assertionFailure("UIWindow is not instantiated.")
            return ModalViewPresenter(parentWindow: UIWindow(), designer: designer)
        }
        return ModalViewPresenter(parentWindow: window!, designer: designer)
    }
}
