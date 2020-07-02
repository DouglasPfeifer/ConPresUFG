//
//  LoginCoordinator.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 29/06/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class LoginCoordinator: Coordinator {
    
    // MARK: Parameters
    
    /// The main window of the app.
    private var window: UIWindow

    /// The view controller presenting the login screen.
    /// - Note: If not set, the controller is displayed as the the window's root one.
    var rootController: UIViewController?
        
    private(set) var loginViewController: LoginViewController!
    private(set) var loginViewModel: LoginViewModel!
    
    private(set) var goToHome = PublishSubject<Void>()
    
    // MARK: Initializers
    
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: Imperatives
    
    override func start() {
        super.start()

        setupLoginController()
        setupBinding()
        setupRootViewController()
    }

    // MARK: Internal methods
    
    private func setupLoginController() {
        loginViewController = UIStoryboard.instantiateController(
            fromStoryboardNamed: StoryboardName.login.rawValue,
            usingControllerIdentifier: StoryboardIdentifier.loginViewController.rawValue
        )
        
        loginViewModel = LoginViewModel()
        loginViewController.viewModel = loginViewModel
    }
    
    private func setupBinding() {
        loginViewController.goToHome
            .bind(to: goToHome)
            .disposed(by: loginViewController.disposeBag)
    }
    
    private func setupRootViewController() {
        if let rootController = rootController {
            loginViewController.modalPresentationStyle = .fullScreen
            rootController.present(loginViewController, animated: true)
        } else {
            window.rootViewController = loginViewController
            window.makeKeyAndVisible()
        }
    }
}
