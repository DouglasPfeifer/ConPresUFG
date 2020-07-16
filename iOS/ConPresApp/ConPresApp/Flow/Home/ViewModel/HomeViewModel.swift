//
//  HomeViewModel.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 29/06/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    func getDayOfTheWeek (weekDay: Int) -> String {
        let weekDayString = DateUtil.getCurrentWeekDay(day: weekDay)
        let dayMonthWeekString = DateUtil.getDayMonthYear(day: weekDay)
        return "\(weekDayString) - \(dayMonthWeekString)"
    }
}
