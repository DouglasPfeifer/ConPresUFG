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
    case registerAttendance = "RegisterAttendance"
    case checkAttendance = "CheckAttendance"
    case studentsAttendance = "StudentsAttendance"
    case sendToSIGAA = "SendToSIGAA"
    case lecturersAttendance = "LecturersAttendance"
    case offerClass = "OfferClass"
    case addCalendar = "AddCalendar"
    case addDiscipline = "AddDiscipline"
    case addLecturer = "AddLecturer"
    case addClassroom = "AddClassroom"
}

enum StoryboardIdentifier: String {
    // ViewControllers
    case navigationController = "navigationController"
    case loginViewController = "loginViewController"
    case homeViewController = "homeViewController"
    case sideMenuViewController = "sideMenuViewController"
    case studentClassPasswordViewController = "studentClassPasswordViewController"
    case teacherClassViewController = "teacherClassViewController"
    case registerAttendanceViewController = "RegisterAttendanceViewController"
    case checkAttendanceViewController = "CheckAttendanceViewController"
    case studentsAttendanceViewController = "StudentsAttendanceViewController"
    case sendToSIGAAViewController = "SendToSIGAAViewController"
    case lecturersAttendanceViewController = "LecturersAttendanceViewController"
    case offerClassViewController = "OfferClassViewController"
    case addCalendarViewController = "AddCalendarViewController"
    case addDisciplineViewController = "AddDisciplineViewController"
    case addLecturerViewController = "AddLecturerViewController"
    case addClassroomViewController = "AddClassroomViewController"
    
    // Cells
    case sideMenuCell = "sideMenuCell"
    case homeCell = "homeCell"
    case addClassCell = "addClassCell"
    
    // Segues
    case showHomeSegue = "showHomeSegue"
    case showAskStudentClassPasswordSegue = "showAskStudentClassPasswordSegue"
    case showStudentClassSegue = "showStudentClassSegue"
    case showTeacherClassSegue = "showTeacherClassSegue"
    case showAddClassSegue = "showAddClassSegue"
    case showAddSelectedClassSegue = "showAddSelectedClassSegue"
}

enum UserTypes: Int {
    case student = 0
    case teacher = 1
    case NDE = 2
    case courseCoordinator = 3
}

enum NumMenuOptions {
    static let student = 2
    static let teacher = 4
    static let NDE = 2
    static let courseCoordinator = 7
}
