//
//  TimeConverter.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 03/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

//import Foundation
//
//class PerdiodConverter {
//
//    /// 23m23 -> Segunda e Terça das 8:00 às 10:00
//    static func abbreviatedToLongFormat(_ abbreviatedTime: String) -> [String] {
//        let longFormat: [String] = [""]
//
//        let arrayAbbreviatedPerdiods = abbreviatedTime.split(separator: " ")
//
//        for abbreviatedPerdiod in arrayAbbreviatedPerdiods {
//            let a = separateDayAndSchedule(abbreviatedPerdiod)
//        }
//
//        return longFormat
//    }
//
//    private func separateDayAndSchedule(abbreviatedPerdiod: String) -> [String] {
//        let dayAndSchedule: [String] = [""]
//
//        if abbreviatedPerdiod.components(separatedBy: "M").count > 1 {
//            let morningPeriod = abbreviatedPerdiod.components(separatedBy: "M")
//
//            print("periodM: ", morningPeriod)
//        }
//
//        if abbreviatedPerdiod.components(separatedBy: "T").count > 1 {
//            let afternoonPeriod = abbreviatedPerdiod.components(separatedBy: "T")
//            print("periodT: ", afternoonPeriod)
//        }
//
//        if abbreviatedPerdiod.components(separatedBy: "N").count > 1 {
//            let nightPeriod = abbreviatedPerdiod.components(separatedBy: "N")
//            print("periodN: ", nightPeriod)
//        }
//        print("===============\n")
//    }
//}
