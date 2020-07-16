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
    case teacherClass = "TeacherClass"
}

enum StoryboardIdentifier: String {
    // ViewControllers
    case navigationController = "navigationController"
    case loginViewController = "loginViewController"
    case homeViewController = "homeViewController"
    case sideMenuViewController = "sideMenuViewController"
    case studentClassPasswordViewController = "studentClassPasswordViewController"
    case teacherClassViewController = "teacherClassViewController"
    
    // Cells
    case sideMenuCell = "sideMenuCell"
    case homeCell = "homeCell"
    
    // Segues
    case showHomeSegue = "showHomeSegue"
    case showAskStudentClassPasswordSegue = "showAskStudentClassPasswordSegue"
    case showStudentClassSegue = "showStudentClassSegue"
    case showTeacherClassSegue = "showTeacherClassSegue"
}
