//
//  HomeViewModel.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 29/06/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation

class HomeViewModel: BaseViewModel {
    
    // MARK: Properties
    var studentClasses = StudentClassesMock().mockStudentClass
    var headerTitleArray = [String?]()
    var numberOfSections: Int! = 0
    var classesByHeader: [String: [Class]] = [String: [Class]]()
    var selectedClass: Class? = nil
    
    // MARK: Initializer
    override init() {
        super.init()
        
        setSections()
    }
    
    // MARK: TableView functions
    private func setSections() {
        sortStudentClasses()

        numberOfSections = 0
        headerTitleArray.removeAll()
        classesByHeader.removeAll()
        var latestDay: Int! = -1
        var latestMonth: Int! = -1
        var latestYear: Int! = -1
        var headerTitle: String! = ""
        for classe in studentClasses {
            if let day = classe.startDate?.get(.day),
               let month = classe.startDate?.get(.month),
               let year = classe.startDate?.get(.year) {
                if latestDay != day || latestMonth != month || latestYear != year {
                    latestDay = day
                    latestMonth = month
                    latestYear = year
                    headerTitle = "\(classe.startDate?.dayOfWeek() ?? "Indefinido") - \(latestDay!)/\(latestMonth!)/\(latestYear!)"
                    
                    classesByHeader[headerTitle] = [Class]()
                    classesByHeader[headerTitle]?.append(classe)
                    headerTitleArray.append(headerTitle)
                    numberOfSections += 1
                } else {
                    classesByHeader[headerTitle]?.append(classe)
                }
            }
        }
    }
    
    func getHeaderTitleFor(section: Int!) -> String! {
        guard let headerTitle = headerTitleArray[section] else { return "Indefinido" }
        return headerTitle
    }
    
    func getNumberRowsInSection(section: Int!) -> Int! {
        guard let key = headerTitleArray[section] else { return 0 }
        return classesByHeader[key]?.count
    }
    
    // MARK: Layout functions
    func getClassTimeInterval(rowClass: Class) -> String {
        guard let startTime = rowClass.startTime?.get(.hour, .minute) else { return "--:-- às --:--" }
        guard let endTime = rowClass.endTime?.get(.hour, .minute) else { return "--:-- às --:--" }
        
        let timeInterval = "\(startTime.hour!):\(startTime.minute!) às \(endTime.hour!):\(endTime.minute!)"
        return timeInterval
    }
    
    // MARK: Model functions
    func sortStudentClasses() {
        studentClasses = studentClasses.sorted(by: {
            $0.startDate! > $1.startDate!
        })
    }
    
    func setCurrentClass(section: Int, row: Int) {
        guard let key = getHeaderTitleFor(section: section),
              let currentClass = classesByHeader[key]?[row] else { return }
        selectedClass = currentClass
   }
}
