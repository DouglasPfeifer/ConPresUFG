//
//  Classroom.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 23/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation

class Classroom {
    var code: Int?
    var latitude: Double?
    var longitude: Double?
    
    init(code: Int?, latitude: Double?, longitude: Double?) {
        self.code = code
        self.latitude = latitude
        self.longitude = longitude
    }
}
