//
//  Discipline.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 10/12/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation

struct Discipline: Decodable {
    var code: Int?
    var schedule: String?
    
    var name: String?
    var classroom: String?
    var startTime: String?
    var endTime: String?
    
    var password: String?
    var latitude: Double?
    var longitude: Double?
    
    init(code: Int,
         schedule: String,
         name: String,
         classroom: String,
         startTime: String,
         endTime: String,
         password: String?,
         latitude: Double?,
         longitude: Double?) {
        self.code = code
        self.schedule = schedule
        self.classroom = classroom
        self.name = name
        self.startTime = startTime
        self.endTime = endTime
        self.password = password
        self.latitude = latitude
        self.longitude = longitude
    }
    
    enum CodingKeys: String, CodingKey {
       case code = "idDisciplina",
            name = "nomeDisciplina"
    }
}
