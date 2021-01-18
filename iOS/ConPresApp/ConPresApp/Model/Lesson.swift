//
//  Lesson.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 23/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation

struct Lesson: Codable {
    var id: Int?
    var attendance: Int?
    
    var discipline: String?
    var disciplineID: Int?
    var lecturer: String?
    var classroom: String?
    var classroomID: Int?
    var campus: String?
    var building: String?
    var startTime: String?
    var endTime: String?
    
    var password: String?
    var latitude: Double?
    var longitude: Double?
    
    var lecturerStudents: [LecturerStudent]?
    
    init(id: Int?,
         attendance: Int?,
         discipline: String?,
         lecturer: String?,
         classroom: String?,
         startTime: String?,
         endTime: String?,
         password: String?,
         latitude: Double?,
         longitude: Double?,
         lecturerStudents: [LecturerStudent]?) {
        self.id = id
        self.attendance = attendance
        self.lecturer = lecturer
        self.classroom = classroom
        self.discipline = discipline
        if let unwrappedStartTime = startTime {
            self.startTime = unwrappedStartTime
        }
        if let unwrappedendTime = endTime {
            self.endTime = unwrappedendTime
        }
        self.password = password
        self.latitude = latitude
        self.longitude = longitude
        self.lecturerStudents = lecturerStudents
    }
    
    enum CodingKeys: String, CodingKey {
       case id = "id",
            attendance = "status",
            disciplineID = "idTurma",
            classroom = "sala",
            classroomID = "idSala",
            campus = "campus",
            building = "predio",
            discipline = "disciplina",
            lecturer = "professor",
            startTime = "inicio",
            endTime = "fim",
            password = "password",
            latitude = "latitude",
            longitude = "longitude",
            lecturerStudents = "lecturerStudents"
    }
}
