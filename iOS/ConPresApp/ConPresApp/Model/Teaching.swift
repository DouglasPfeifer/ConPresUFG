//
//  Teaching.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 23/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation

/// Docência
class Teaching {
    var plannedWorkload: Int?
    var totalAttendance: Int?
    var totalAbsence: Int?
    var currentAttendancePercentage: Double?
    var totalAttendancePercentage: Double?
    
    init(plannedWorkload: Int?, totalAttendance: Int?, totalAbsence: Int?, currentAttendancePercentage: Double?, totalAttendancePercentage: Double?) {
        self.plannedWorkload = plannedWorkload
        self.totalAttendance = totalAttendance
        self.totalAbsence = totalAbsence
        self.currentAttendancePercentage = currentAttendancePercentage
        self.totalAttendancePercentage = totalAttendancePercentage
    }
}
