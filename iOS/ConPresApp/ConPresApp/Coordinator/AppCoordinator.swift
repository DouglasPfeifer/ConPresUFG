//
//  AppCoordinator.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 26/06/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

/// Coordinates the initial flow of the app.
///
/// The initial flow of the app consists of four scenarios:
/// - It's the first launch
/// - It's already launched, but the user didn't sign up yet
/// - The user signed up and needs to log into the app
/// - The app receives a deep linking request
///
/// This class manages the initialization flow, according to those scenarios.
class AppCoordinator: Coordinator {

    // MARK: Properties

    /// The main navigation controller of the app.
    var window: UIWindow!

    // MARK: Initializers

    init(window: UIWindow) {
        self.window = window
    }

    // MARK: Start

    override func start() {
        presentLogin()
//        if !UserDefaults.wasAppLaunched {
//            presentLogin()
//            UserDefaults.wasAppLaunched = true
//        } else {
//            handleNormalFlow()
//            UserDefaults.wasAppLaunched = false
//        }
    }

    // MARK: Private methods
    /// Presents the Login screen to the user.
    private func presentLogin() {
        let loginCoordinator = LoginCoordinator(window: window)
        
        loginCoordinator.goToHome
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] (_) in
                self?.presentNavigationBar()
            }).disposed(by: disposeBag)
        
        pushCoordinator(loginCoordinator)
    }
    
    /// Manages the normal flow of the app
    private func handleNormalFlow() {
        presentNavigationBar()
    }

    /// Presents the Home screen to the user and main controller of the app.
    private func presentNavigationBar() {
        let navigationBarCoordinator = NavigationBarCoordinator(parentCoordinator: self)
        navigationBarCoordinator.start()
        
        childCoordinators.append(navigationBarCoordinator)
        setRootController(navigationBarCoordinator.baseController)
    }
    
    /// Given a controller, attaches it as the root controller of the app.
    /// - Parameter controller: the controller to be attached to the window.
    private func setRootController(_ controller: UIViewController) {
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }
}
