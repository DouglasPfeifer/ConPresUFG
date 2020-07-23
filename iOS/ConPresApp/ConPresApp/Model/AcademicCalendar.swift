//
//  AcademicCalendar.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 23/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation

/// Código do calendário acadêmico
class CalendarCode {
    var year: Int?
    var semester: Int?
    
    init(year: Int?, semester: Int?) {
        self.year = year
        self.semester = semester
    }
}

/// Calendário acadêmico
class AcademicCalendar {
    var ID: String?
    var code: CalendarCode?
    var semesterStartDate: String?
    var semesterEndDate: String?
    var semesterHolidayDates: [Date?]?
    
    init(ID: String?, code: CalendarCode?, semesterStartDate: String?, semesterEndDate: String?, semesterHolidayDates: [Date?]?) {
        self.ID = ID
        self.code = code
        self.semesterStartDate = semesterStartDate
        self.semesterEndDate = semesterEndDate
        self.semesterHolidayDates = semesterHolidayDates
    }
}
