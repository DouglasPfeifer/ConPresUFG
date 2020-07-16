//
//  Date.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 15/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation

class DateUtil {
    
    static private func setTimeZone(calendar: Calendar) -> Calendar {
        var calendar = calendar
        var localTimeZoneAbbreviation: String { return TimeZone.current.abbreviation() ?? "" }
        calendar.timeZone = TimeZone(identifier: localTimeZoneAbbreviation)!
        return calendar
    }
    
    static func getCurrentWeekDay(day: Int) -> String {
        let date = Date()
        let formatter = DateFormatter()
        var calendar = Calendar.current
        
        formatter.locale = Locale(identifier: "pt_BR")
        calendar = setTimeZone(calendar: calendar)
        
        var weekDayNumber = calendar.component(.weekday, from: date) - 1
        weekDayNumber = weekDayNumber + day
        if weekDayNumber > 6 {
            weekDayNumber = weekDayNumber - 7
        }
        var weekDayString = formatter.weekdaySymbols[weekDayNumber]
            
        weekDayString = weekDayString.capitalizingFirstLetter()
        
        return weekDayString
    }
    
    static func getDayMonthYear(day: Int) -> String {
        let date = Date()
        let formatter = DateFormatter()
        let calendar = Calendar.current
        
        formatter.dateFormat = "dd/MM/yyyy"
        let ddMMyyyy = formatter.string(from: calendar.date(byAdding: .day, value: day, to: date)!)
        
        return ddMMyyyy
    }
}
