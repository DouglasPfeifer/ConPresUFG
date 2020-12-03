//
//  CommonTypes.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 29/06/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation

enum StoryboardName: String {
    case login = "Login"
    case home = "Home"
    case sideMenu = "SideMenu"
    case studentClass = "StudentClass"
}

enum StoryboardIdentifier: String {
    // ViewControllers
    case navigationController = "navigationController"
    case loginViewController = "loginViewController"
    case homeViewController = "homeViewController"
    case sideMenuViewController = "sideMenuViewController"
    case studentClassViewController = "studentClassViewController"
    
    // Cells
    case sideMenuCell = "sideMenuCell"
    case homeCell = "homeCell"
    case addClassCell = "addClassCell"
    
    // Segues
    case showHomeSegue = "showHomeSegue"
    case showStudentClassSegue = "showStudentClassSegue"
    case showAddClassSegue = "showAddClassSegue"
    case showAddSelectedClassSegue = "showAddSelectedClassSegue"
}

enum UserTypes: Int {
    case student = 0
    case teacher = 1
}

enum NumMenuOptions {
    static let student = 2
    static let teacher = 4
}
