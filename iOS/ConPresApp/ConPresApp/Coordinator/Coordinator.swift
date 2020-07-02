//
//  Coordinator.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 26/06/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import UIKit
import RxSwift

/// In charge of handling the different flows of the app.
class Coordinator: NSObject {

    // MARK: Properties

    /// Any child coordinators of the current one.
    /// - Note: This array ensures the child coordinators are kept in memory and also receive events from the parents.
    var childCoordinators = [Coordinator]()

    /// Observable indicating that the current coordiator stop its presentation flow.
    let didFinish = PublishSubject<Coordinator>()

    let disposeBag = DisposeBag()
    
    /// Parent coordinator
    var parentCoordinator: Coordinator?

    // MARK: Imperatives

    /// Starts the flow being handled.
    func start() {}

    func pushCoordinator(_ coordinator: Coordinator) {
        // Install Handler
        coordinator
            .didFinish
            .subscribe(onNext: { [weak self] (coordinator) in
                self?.popCoordinator(coordinator)
            })
            .disposed(by: disposeBag)

        // Start Coordinator
        coordinator.start()

        // Append to Child Coordinators
        childCoordinators.append(coordinator)
    }

    func popCoordinator(_ coordinator: Coordinator) {
        // Remove Coordinator From Child Coordinators
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
}

extension Coordinator: UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        childCoordinators.forEach { coordinator in
            coordinator.navigationController(navigationController, willShow: viewController, animated: animated)
        }
    }

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        childCoordinators.forEach { coordinator in
            coordinator.navigationController(navigationController, didShow: viewController, animated: animated)
        }
    }
}
