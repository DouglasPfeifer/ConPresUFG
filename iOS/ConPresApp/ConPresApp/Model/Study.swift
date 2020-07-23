//
//  Study.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 23/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation

/// Estudo
class Study {
    var finalStatus: String?
    var totalAttendance: Int?
    var totalAbsence: Int?
    var currentAttendancePercentage: Double?
    var totalAttendancePercentage: Double?
    
    init(finalStatus: String?, totalAttendance: Int?, totalAbsence: Int?, currentAttendancePercentage: Double?, totalAttendancePercentage: Double?) {
        self.finalStatus = finalStatus
        self.totalAttendance = totalAttendance
        self.totalAbsence = totalAbsence
        self.currentAttendancePercentage = currentAttendancePercentage
        self.totalAttendancePercentage = totalAttendancePercentage
    }
}
