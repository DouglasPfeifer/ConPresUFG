//
//  BaseViewController.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 26/06/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import UIKit
import RxSwift

/// The base implementation for all controllers using the app to inherit from.
class BaseViewController: UIViewController {

    // MARK: Properties

    var disposeBag = DisposeBag()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    // MARK: Imperatives

    override func present(
        _ viewControllerToPresent: UIViewController,
        animated flag: Bool,
        completion: (() -> Void)? = nil
    ) {
        if #available(iOS 13, *) {
            // Set the default presentation style to continue being full screen
            // (iOS 13 changes it with a new animation).
            viewControllerToPresent.modalPresentationStyle = .fullScreen
        }

        super.present(
            viewControllerToPresent,
            animated: flag,
            completion: completion
        )
    }
}
