//
//  FirstItemCoordinator.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 01/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

/// Coordinator handling the flow of screens to display the change PIN information.
class FirstItemCoordinator: Coordinator {
    
    // MARK: Properties
    
    private(set) var firstItemViewController: FirstItemViewController!
    private(set) var baseController: UINavigationController!
    
    // MARK: Imperatives
    
    override func start() {
        super.start()
        displayFirstItem()
        setupStart()
    }
    
    func setBaseController(baseController: UINavigationController) {
        self.baseController = baseController
    }
    
    // MARK: Internal Methods
    
    private func displayFirstItem() {
        baseController = UIStoryboard.instantiateController(
            fromStoryboardNamed: StoryboardName.firstItem.rawValue,
            usingControllerIdentifier: StoryboardIdentifier.navigationController.rawValue
        )
        firstItemViewController = baseController.viewControllers.first as? FirstItemViewController
    }
    
    private func setupStart() {
        baseController.delegate = self
    }
}

extension FirstItemCoordinator {
    
    override func navigationController(_ navigationController: UINavigationController,
                                       willShow viewController: UIViewController,
                                       animated: Bool) {
        super.navigationController(navigationController, willShow: viewController, animated: animated)
    }
}
