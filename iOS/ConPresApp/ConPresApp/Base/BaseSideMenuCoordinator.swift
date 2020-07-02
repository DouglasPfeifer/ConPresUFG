//
//  BaseSideMenuCoordinator.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 29/06/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation
import UIKit
import SideMenuSwift
import RxCocoa
import RxSwift

class BaseMenuCoordinator: Coordinator {
    
    // MARK: Properties
    
    /// Used as a starting point for the next coordinator screens.
    var baseController: UINavigationController
    
    ///Used to show with menu
    internal var baseWithSideMenuController: UIViewController?
    
    internal lazy var sideMenuCoordinator = SideMenuCoordinator()
    internal lazy var firstItemCoordinator = FirstItemCoordinator()
    internal lazy var secondItemCoordinator = SecondItemCoordinator()
    
    var baseMenuController: UIViewController {
        guard let baseSideMenu = baseWithSideMenuController else {
            assertionFailure("Base side menu is not instantiated. Must be call startWithMenu:")
            return UIViewController()
        }
        return baseSideMenu
    }
    
    init(baseController: UINavigationController) {
        self.baseController = baseController
    }
    
    func startWithMenu() {
        sideMenuCoordinator.start()
        
        sideMenuCoordinator.showFirstItem
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] (_) in
                self?.displayFirstItem()
            }).disposed(by: disposeBag)

        sideMenuCoordinator.showSecondItem
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] (_) in
                self?.displaySecondItem()
            }).disposed(by: disposeBag)
        
        self.childCoordinators.append(sideMenuCoordinator)
        
        baseWithSideMenuController = SideMenuController(contentViewController: baseController, menuViewController: sideMenuCoordinator.baseController)
    }

    @objc private func displayFirstItem(_ notification: Notification? = nil) {
        firstItemCoordinator.start()
        firstItemCoordinator.setBaseController(baseController: baseController)
        //TODO: Mudar a forma que os coordinators são chamados.
        self.baseController.pushViewController(firstItemCoordinator.firstItemViewController, animated: true)
    }

    @objc private func displaySecondItem(_ notification: Notification? = nil) {
        secondItemCoordinator.setBaseController(baseController: baseController)
        secondItemCoordinator.start()
        self.baseController.pushViewController(secondItemCoordinator.secondItemViewController, animated: true)
    }
}
