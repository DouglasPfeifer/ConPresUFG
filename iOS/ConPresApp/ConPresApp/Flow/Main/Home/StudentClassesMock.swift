//
//  HomeMock.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 22/11/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation

class Mock {
    
    // General properties
    var lessons: [Lesson]!
    
    // Student properties
    var studentDisciplineName: String!
    var lecturer: String!
    var studentClassroom: Int!
    
    // Lecturer properties
    var lecturerDisciplines: [Discipline]!
    var lecturerDisciplineName: String!
    var lecturerClassroom: String!
    
    init(userType: Int) {
        switch userType {
        case UserTypes.student.rawValue:
            lessons = getStudentLessons()
        case UserTypes.lecturer.rawValue:
            lessons = getLecturerLessons()
            lecturerDisciplines = getLecturerDisciplines()
        default:
            lessons = getStudentLessons()
            lecturerDisciplines = getLecturerDisciplines()
        }
    }
    
    // MARK: - General
    func getLessons(userType: Int) -> [Lesson] {
        switch userType {
        case UserTypes.student.rawValue:
            lessons = getStudentLessons()
        case UserTypes.lecturer.rawValue:
            lessons = getLecturerLessons()
        default:
            lessons = getStudentLessons()
        }
        return lessons
    }
    
    // MARK: - Student
    func getStudentLessons() -> [Lesson] {
        var lessons = [Lesson]()
        for discipline in 0...2 {
            for lesson in 0...34 {
                if discipline == 0 {
                    studentDisciplineName = "Engenharia de requisitos"
                    lecturer = "João da Silva"
                } else if discipline == 1 {
                    studentDisciplineName = "Programação Orientada a Objetos"
                    lecturer = "Roberto Carlos"
                } else {
                    studentDisciplineName = "Banco de Dados"
                    lecturer = "José Marinho"
                }
                if lesson % 2 == 0 {
                    studentClassroom = 201
                } else {
                    studentClassroom = 202
                }
                let newLesson = Lesson(id: (discipline + lesson),
                                       attendance: 1,
                                       discipline: studentDisciplineName,
                                       lecturer: lecturer,
                                       classroom: studentClassroom,
                                       startTime: "2021-04-14T10:00:00+0000",
                                       endTime: "2021-04-14T11:40:00+0000",
                                       password: "Password \(discipline)-\(lesson)",
                                       latitude: -16.68026407358496,
                                       longitude: -49.25654600895208,
                                       lecturerStudents: nil)
                lessons.append(newLesson)
            }
        }
        return lessons
    }
    
    // MARK: - Lecturer
    func getLecturerLessons() -> [Lesson] {
        var lessons = [Lesson]()
        for lesson in 0...2 {
            if lesson == 0 {
                studentDisciplineName = "Engenharia de requisitos"
                lecturer = "João da Silva"
                studentClassroom = 201
            } else if lesson == 1 {
                studentDisciplineName = "Programação Orientada a Objetos"
                lecturer = "João da Silva"
                studentClassroom = 202
            } else {
                studentDisciplineName = "Banco de Dados"
                lecturer = "João da Silva"
                studentClassroom = 203
            }
            
            var lecturerStudents = [LecturerStudent]()
            for index in 0...39 {
                let newLecturerStudent = LecturerStudent(id: "\(index)",
                                                         name: "StudentName StudentSurname StudentLastName \(index)",
                                                         attendance: true)
                lecturerStudents.append(newLecturerStudent)
            }
            
            let newLesson = Lesson(id: lesson,
                                   attendance: 1,
                                   discipline: studentDisciplineName,
                                   lecturer: lecturer,
                                   classroom: studentClassroom,
                                   startTime: "2021-04-14T10:00:00+0000",
                                   endTime: "2021-04-14T11:40:00+0000",
                                   password: "Password \(lesson)-\(lesson)",
                                   latitude: -16.68026407358496,
                                   longitude: -49.25654600895208,
                                   lecturerStudents: lecturerStudents)
            lessons.append(newLesson)
        }
        return lessons
    }
    
    func getLecturerDisciplines() -> [Discipline] {
        var disciplines = [Discipline]()
        for discipline in 0...2 {
            if discipline == 0 {
                lecturerDisciplineName = "Engenharia de requisitos"
                lecturerClassroom = "CAB 201"
            } else if discipline == 1 {
                lecturerDisciplineName = "Programação Orientada a Objetos"
                lecturerClassroom = "CAB 202"
            } else {
                lecturerDisciplineName = "Banco de Dados"
                lecturerClassroom = "CAB 203"
            }
            let newDiscipline = Discipline(code: discipline,
                                           schedule: "Schedule \(discipline)",
                                           name: lecturerDisciplineName,
                                           classroom: lecturerClassroom,
                                           startTime: "2021-04-14T10:00:00+0000",
                                           endTime: "2021-04-14T11:40:00+0000",
                                           password: nil,
                                           latitude: -16.68026407358496,
                                           longitude: -49.25654600895208)
            disciplines.append(newDiscipline)
        }
        return disciplines
    }
}
