//
//  LecturerStudent.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 20/12/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation

struct LecturerStudent: Codable {
    var id: String?
    var name: String?
    var attendance: Bool?
    
    init(id: String,
         name: String,
         attendance: Bool) {
        self.id = id
        self.name = name
        self.attendance = attendance
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id",
             name = "name",
             attendance = "attendance"
    }
}
