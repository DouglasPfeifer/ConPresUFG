//
//  SideMenuCoordinator.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 29/06/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

/// Coordinator handling the flow of screens to display the user's menu.
class SideMenuCoordinator: Coordinator {
    
    // MARK: Properties
    
    /// Used as a starting point for the next coordinator screens.
    var baseController: UINavigationController
        
    /// The controller listing the user's certificates.
    private(set) var sideMenuViewController: SideMenuViewController!
        
    var showFirstItem = PublishSubject<Void>()
    var showSecondItem = PublishSubject<Void>()

    // MARK: Initializers
    
    override init() {
        sideMenuViewController = UIStoryboard.instantiateController(
            fromStoryboardNamed: StoryboardName.sideMenu.rawValue,
            usingControllerIdentifier: StoryboardIdentifier.sideMenuViewController.rawValue
        )
        
        baseController = BaseNavigationViewController(rootViewController: sideMenuViewController)
        super.init()
        
    }
    
    // MARK: Imperatives
    
    override func start() {
        baseController.delegate = self

        self.displayMenu()
        
        sideMenuViewController.showFirstItem
            .debug()
            .bind(to: showFirstItem)
            .disposed(by: disposeBag)

        sideMenuViewController.showSecondItem
            .debug()
            .bind(to: showSecondItem)
            .disposed(by: disposeBag)
    }
    
    // MARK: Internal Methods
    
    private func displayMenu() {
        sideMenuViewController.viewModel = SideMenuViewModel()
    }
}
