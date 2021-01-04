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
    case studentLesson = "StudentLesson"
    case studentCheckAttendance = "StudentCheckAttendance"
    case lecturerCheckAttendance = "LecturerCheckAttendance"
}

enum StoryboardIdentifier: String {
    // ViewControllers
    case navigationController = "navigationController"
    case loginViewController = "loginViewController"
    case homeViewController = "homeViewController"
    case sideMenuViewController = "sideMenuViewController"
    case studentLessonViewController = "studentLessonViewController"
    case studentDisciplineViewController = "StudentDisciplineViewController"
    case studentDisciplineAttendanceViewController = "StudentDisciplineAttendanceViewController"
    case lecturerLessonViewController = "LecturerLessonViewController"
    case lecturerDisciplineViewController = "LecturerDisciplineViewController"

    // Cells
    case sideMenuCell = "sideMenuCell"
    case homeCell = "homeCell"
    case addLessonCell = "addLessonCell"
    case studentDisciplineCell = "studentDisciplineCell"
    case studentDisciplineAttendanceCell = "studentDisciplineAttendanceCell"
    case lecturerDisciplineCell = "lecturerDisciplineCell"
    case lecturerDisciplineAttendanceCell = "lecturerDisciplineAttendanceCell"
    case lecturerLessonAttendanceTableViewCell = "lecturerLessonAttendanceTableViewCell"
    
    // General Segues
    case showHomeSegue = "showHomeSegue"
    
    // Student Segues
    case showStudentLessonSegue = "showStudentLessonSegue"
    case showStudentDisciplineAttendanceSegue = "showStudentDisciplineAttendanceSegue"
    
    // Lecturer Segues
    case showLecturerLessonSegue = "showLecturerLessonSegue"
    case showLecturerDisciplineAttendanceSegue = "showLecturerDisciplineAttendanceSegue"
    case showLecturerLessonAttendanceSegue = "showLecturerLessonAttendanceSegue"
    
    
    case showAddLessonSegue = "showAddLessonSegue"
    case showAddSelectedLessonSegue = "showAddSelectedLessonSegue"
}

enum UserTypes: Int {
    case student = 0
    case lecturer = 1
}

enum NumMenuOptions {
    static let student = 1
    static let lecturer = 1
}
