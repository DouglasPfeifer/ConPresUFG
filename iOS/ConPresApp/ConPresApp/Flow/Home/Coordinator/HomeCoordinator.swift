//
//  HomeCoordinator.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 29/06/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import SideMenuSwift

class HomeCoordinator: BaseMenuCoordinator {
    
    // MARK: Parameters

    let sideMenuViewController = SideMenuController()
        
    private(set) var homeViewController: HomeViewController!
    private(set) var homeViewModel: HomeViewModel!
    
    // MARK: Initializers
    
    init() {
        homeViewController = UIStoryboard.instantiateController(
            fromStoryboardNamed: StoryboardName.home.rawValue,
            usingControllerIdentifier: StoryboardIdentifier.homeViewController.rawValue
        )
        super.init(baseController: BaseNavigationViewController(rootViewController: homeViewController))
    }
    
    // MARK: Imperatives
    
    override func startWithMenu() {
        super.startWithMenu()
        setupHomeViewController()
    }
    
    // MARK: Internal methods
    
    private func setupHomeViewController() {
        homeViewModel = HomeViewModel()
        homeViewController.viewModel = homeViewModel
        
        homeViewController.displayMenu
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] (_) in
                self?.showMenu()
            }).disposed(by: homeViewController.disposeBag)
        
        homeViewController.setupMenuBar()
    }
    
    func showMenu() {
        homeViewController.sideMenuController?.revealMenu()
    }
}
