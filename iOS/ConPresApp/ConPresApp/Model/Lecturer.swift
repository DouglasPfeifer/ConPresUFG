//
//  Lecturer.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 23/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation

/// Docente
class Lecturer {
    var registrationID: Int?
    var fullname: String?
    var socialname: String?
    var email: String?
    var password: String?
    var deviceID: String?
    
    init(registrationID: Int?, fullname: String?, socialname: String?, email: String?, password: String?, deviceID: String?) {
        self.registrationID = registrationID
        self.fullname = fullname
        self.socialname = socialname
        self.email = email
        self.password = password
        self.deviceID = deviceID
    }
}
