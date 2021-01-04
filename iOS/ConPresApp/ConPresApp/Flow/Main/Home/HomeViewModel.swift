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
    var mock: Mock!
    var headerTitleArray = [String?]()
    var numberOfSections: Int! = 0
    var lessonsByHeader: [String: [Lesson]] = [String: [Lesson]]()
    var lessons: [Lesson]? = nil
    var selectedLesson: Lesson? = nil
        
    // MARK: Initializer
    init(completion: @escaping (Bool) -> ()) {
        super.init()
//        mock = Mock(userType: userType)
//        lessons = mock.getLessons(userType: userType)
        
        setSections()

        getUserLessons { (success) in
            if success {
                self.setSections()
                completion(success)
            }
        }
    }
    
    // MARK: TableView functions
    private func setSections() {
        guard let unwrappedLessons = lessons else {
            return
        }
        
        sortLessons()

        numberOfSections = 0
        headerTitleArray.removeAll()
        lessonsByHeader.removeAll()
        var latestDay: Int! = -1
        var latestMonth: Int! = -1
        var latestYear: Int! = -1
        var headerTitle: String! = ""
        for lesson in unwrappedLessons {
            if let day = lesson.startTime?.convertToDate().get(.day),
               let month = lesson.startTime?.convertToDate().get(.month),
               let year = lesson.startTime?.convertToDate().get(.year) {
                if latestDay != day || latestMonth != month || latestYear != year {
                    latestDay = day
                    latestMonth = month
                    latestYear = year
                    headerTitle = "\(lesson.startTime?.convertToDate().dayOfWeek() ?? "Indefinido") - \(latestDay!)/\(latestMonth!)/\(latestYear!)"
                    
                    lessonsByHeader[headerTitle] = [Lesson]()
                    lessonsByHeader[headerTitle]?.append(lesson)
                    headerTitleArray.append(headerTitle)
                    numberOfSections += 1
                } else {
                    lessonsByHeader[headerTitle]?.append(lesson)
                }
            }
        }
    }
    
    func getNumberOfSections() -> Int {
        guard let sections = numberOfSections else { return 0 }
        return sections
    }
    
    func getHeaderTitleFor(section: Int!) -> String! {
        guard let headerTitle = headerTitleArray[section] else { return "Indefinido" }
        return headerTitle
    }
    
    func getNumberRowsInSection(section: Int) -> Int {
        guard let key = headerTitleArray[section],
              let numberOfLesson = lessonsByHeader[key] else { return 0 }
        return numberOfLesson.count
    }
    
    // MARK: Layout functions
    func getLessonTimeInterval(rowLesson: Lesson) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        guard let startTime = rowLesson.startTime else { return "--:-- às --:--" }
        let startTimeString = dateFormatter.string(from: startTime.convertToDate())
        
        guard let endTime = rowLesson.endTime else { return "\(startTimeString) às --:--" }
        let endTimeString = dateFormatter.string(from: endTime.convertToDate())
        
        let timeInterval = "\(startTimeString) às \(endTimeString)"
        
        return timeInterval
    }
    
    // MARK: Model functions
    func sortLessons() {
        guard let unwrappedLessons = lessons else { return }
        lessons = unwrappedLessons.sorted(by: {
            $0.startTime! > $1.startTime!
        })
    }
    
    func setSelectedLesson(section: Int, row: Int) {
        guard let key = getHeaderTitleFor(section: section),
              let selectedLesson = lessonsByHeader[key]?[row] else { return }
        self.selectedLesson = selectedLesson
   }
    
    // MARK: HTTP Requests
    func fetchLessons(completion: @escaping (Bool) -> ()) {
        let id = 1
        networkManager.getUserLessons(userID: id, completion: {
            (lessons, error) in
            if let error = error {
                completion(false)
                return
            }
            dump(lessons)
            self.lessons = lessons
            completion(true)
        })
    }
    
    func getUserLessons(completion: @escaping (Bool) -> ()) {
        let id = 1
        networkManager.getUserLessons(userID: id, completion: {
            (lessons, error) in
            if let error = error {
                completion(false)
                return
            }
            dump(lessons)
            self.lessons = lessons
            completion(true)
        })
    }
}
