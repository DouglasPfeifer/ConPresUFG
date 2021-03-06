//
//  Date+Util.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 22/11/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
    
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized(with: dateFormatter.locale)
    }
    
    func getDayMonthYear() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let ddMMyyyy = formatter.string(from: self)
        return ddMMyyyy
    }
    
    func getHourMinutes() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let HHmm = formatter.string(from: self)
        return HHmm
    }
    
    func dayMinusX(x: Int) -> Date {
        let newDate = Calendar.current.date(byAdding: .day, value: x, to: noon)!
        return newDate
    }
    
    func hourMinusX(x: Int) -> Date {
        let newDate = Calendar.current.date(byAdding: .hour, value: x, to: noon)!
        return newDate
    }
    
    // MARK: FOR MOCK
    static var yesterday: Date { return Date().dayBefore }
    static var tomorrow:  Date { return Date().dayAfter }
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return dayAfter.month != month
    }
}
