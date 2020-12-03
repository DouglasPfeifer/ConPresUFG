//
//  Class.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 23/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation

class Class {
    var code: String?
    var schedule: String?
    var status: Int?
    
    var discipline: String?
    var lecturer: String?
    var classroom: String?
    var startDate: Date?
    var startTime: Date?
    var endTime: Date?
    
    var password: String?
    var latitude: Double?
    var longitude: Double?
    
    init(code: String,
         schedule: String,
         status: Int,
         discipline: String,
         lecturer: String,
         classroom: String,
         startDate: Date,
         startTime: Date,
         endTime: Date,
         password: String?,
         latitude: Double?,
         longitude: Double?) {
        self.code = code
        self.schedule = schedule
        self.status = status
        self.lecturer = lecturer
        self.classroom = classroom
        self.discipline = discipline
        self.startDate = startDate
        self.startTime = startTime
        self.endTime = endTime
        self.password = password
        self.latitude = latitude
        self.longitude = longitude
    }
}
