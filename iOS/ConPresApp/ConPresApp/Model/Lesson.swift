//
//  Aula.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 02/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation

/// Aula
class Lesson {
    var ID: String?
    var plannedDate: Date?
    var plannedStart: Date?
    var plannedEnd: Date?
    
    init(ID: String?, plannedDate: Date?, plannedStart: Date?, plannedEnd: Date?) {
        self.ID = ID
        self.plannedDate = plannedDate
        self.plannedStart = plannedStart
        self.plannedEnd = plannedEnd
    }
}
