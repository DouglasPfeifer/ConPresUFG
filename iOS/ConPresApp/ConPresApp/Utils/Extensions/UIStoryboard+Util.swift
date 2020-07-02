//
//  UIStoryboard+Util.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 29/06/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import UIKit

extension UIStoryboard {

    // MARK: Factories

    /// Given a storyboard name, and the identifier of a controller inside it,
    /// instantiates and returns the controller.
    /// - Parameters:
    ///     - name: the name of the storyboard file.
    ///     - identifier: the id of the controller inside the specified storyboard.
    /// - Returns: the instantiated controller.
    static func instantiateController<UIViewControllerType: UIViewController>(
        fromStoryboardNamed name: String,
        usingControllerIdentifier identifier: String
    ) -> UIViewControllerType {
        let storyboard = UIStoryboard(name: name, bundle: .main)

        guard let controller = storyboard.instantiateViewController(withIdentifier: identifier) as?
            UIViewControllerType else {
                preconditionFailure("The view controller must be correclty set in the storyboard.")
        }

        return controller
    }
}
