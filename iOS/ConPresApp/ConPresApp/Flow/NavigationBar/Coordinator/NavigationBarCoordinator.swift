//
//  NavigationBarCoordinator.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 01/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation
import UIKit

class NavigationBarCoordinator: Coordinator {
        
    var baseController: NavigationBarViewController!
    
    var homeCoordinator: HomeCoordinator!
    
    init(parentCoordinator: Coordinator?) {
        super.init()
        self.parentCoordinator = parentCoordinator
    }
    
    override func start() {
        
        baseController = NavigationBarViewController()
        
        var childViewControllers: [UIViewController] = []
        
        // Home
        homeCoordinator = HomeCoordinator()
        homeCoordinator.startWithMenu()
        childViewControllers.append(homeCoordinator.baseMenuController)
        
        baseController.viewControllers = childViewControllers
    }
}

