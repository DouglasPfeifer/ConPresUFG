//
//  LecturerLessonAttendanceViewModel.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 20/12/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation

class LecturerLessonAttendanceViewModel: BaseViewModel {
    
    // MARK: Properties
    var mock: Mock!
    var currentLesson: Lesson!
    var lastUpdatedCurrentLessonState: Lesson!
        
    // MARK: Initializer
    init(currentLesson: Lesson) {
        super.init()
        self.currentLesson = currentLesson
        self.lastUpdatedCurrentLessonState = currentLesson
        mock = Mock(userType: userType)
    }
    
    func changeStudentAttendanceStatus(row: Int, attended: Bool) {
        currentLesson.lecturerStudents![row].attendance = attended
    }
    
    func updateCurrentLessonState() {
        lastUpdatedCurrentLessonState = currentLesson
    }
    
    func checkIfNeedsUpdate() -> Bool {
        for index in 0...(currentLesson.lecturerStudents!.count - 1) {
            if currentLesson.lecturerStudents![index].attendance != lastUpdatedCurrentLessonState.lecturerStudents![index].attendance {
                return true
            }
        }
        return false
    }
    
    func getNumberOfAttendants() -> Int {
        var attendants = 0
        for student in currentLesson.lecturerStudents! {
            if student.attendance! {
                attendants += 1
            }
        }
        return attendants
    }
    
    func getRowStudent(row: Int) -> LecturerStudent {
        return currentLesson.lecturerStudents![row]
    }
}
