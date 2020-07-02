//
//  UserDefaults+Util.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 29/06/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation

extension UserDefaults {

    // MARK: Properties

    /// Flag informing if the app was already launched for the first time.
    static var wasAppLaunched: Bool {
        set {
            UserDefaults.standard.set(newValue, forKey: "isAppAlreadyLaunchedOnce")
        }
        get {
            return UserDefaults.standard.bool(forKey: "isAppAlreadyLaunchedOnce")
        }
    }
}
