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
    var status: String?
    
    var discipline: String?
    var startDate: String?
    var startTime: String?
    var endTime: String?
    var password: String?
    var latitude: Double?
    var longitude: Double?
    
    init(code: String?, schedule: String?, status: String?) {
        self.code = code
        self.schedule = schedule
        self.status = status
    }
    
    init(discipline: String, startDate: String, startTime: String, endTime: String, password: String?, latitude: Double?, longitude: Double?) {
        self.discipline = discipline
        self.startDate = startDate
        self.startTime = startTime
        self.endTime = endTime
        self.password = password
        self.latitude = latitude
        self.longitude = longitude
    }
}
