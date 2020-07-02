//
//  SideMenuViewModel.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 29/06/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa

enum Menu {

    // MARK: Types

    typealias Item = (identifier: ScreenIdentifier, title: String)

    enum ScreenIdentifier: String {

        // MARK: Cases

        case main
        case first
        case second

        // MARK: Properties

        var title: String {
            var title: String!

            switch self {
            case .main:
                title = Localizable.Menu.main

            case .first:
                title = Localizable.Menu.first

            case .second:
                title = Localizable.Menu.second
            }

            return title
        }

        var icon: UIImage? {
            return nil
        }

        // MARK: Public Interface

        static func toMenuItem(_ identifier: ScreenIdentifier) -> Item {
            return (identifier: identifier, title: identifier.title)
        }
    }
}

protocol MenuViewModelProtocol: class {

    // MARK: Properties

    var options: BehaviorRelay<[Menu.Item]> { get }
}

class SideMenuViewModel: MenuViewModelProtocol {

    // MARK: Properties

    var options: BehaviorRelay<[Menu.Item]> = {
        let identifiers: [Menu.ScreenIdentifier] = [
            .main,
            .first,
            .second
        ]
        return BehaviorRelay(value: identifiers.map(Menu.ScreenIdentifier.toMenuItem))
    }()
}
