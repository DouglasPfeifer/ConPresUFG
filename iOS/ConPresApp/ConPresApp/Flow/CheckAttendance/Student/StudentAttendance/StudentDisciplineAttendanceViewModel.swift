//
//  StudentDisciplineAttendanceViewModel.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 05/12/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation

class StudentDisciplineAttendanceViewModel: BaseViewModel {
    
    // MARK: Properties
    var mock: Mock!
    var lessons: [Lesson]?

    var currentDiscipline: String!
    var disciplineLessons: [Lesson]!
    var disciplineLessonsNames: [String]!
    
    var numberOfLessons: Int!
    var numberOfAttendances: Int!
    var numberOfAbsences: Int!
    var maxAbsences: Float!
    let attendancePerLesson = 1
    let totalNumberOfLessons = 64
    
    // MARK: Initializer
    init(currentDiscipline: String) {
        super.init()
//        mock = Mock(userType: userType)
        if let lessonsArray = UserDefaults.standard.data(forKey: "studentLessonsArray") {
            do {
                lessons = try JSONDecoder().decode([Lesson].self, from: lessonsArray)
            } catch {
                print("asd erro")
            }
        }
        
        self.currentDiscipline = currentDiscipline
        setDisciplineLessons()
        sortDisciplinesLessons()
    }
    
    // MARK: Internal Methods
    private func setDisciplineLessons() {
        disciplineLessons = [Lesson]()
        numberOfLessons = 0
        numberOfAttendances = 0
        numberOfAbsences = 0
        maxAbsences = 0.0
        
        for lesson in lessons! {
            if lesson.discipline == currentDiscipline {
                disciplineLessons.append(lesson)
                numberOfLessons += attendancePerLesson
                guard let attended = lesson.attendance else {
                    continue
                }
                if attended == 1 {
                    numberOfAttendances += attendancePerLesson
                } else {
                    numberOfAbsences += attendancePerLesson
                }
            }
        }
        maxAbsences = Float(totalNumberOfLessons) * 0.25
    }
    
    private func sortDisciplinesLessons() {
        disciplineLessons = disciplineLessons.sorted(by: {
            if $0.startTime != $1.startTime {
                return $0.startTime! > $1.startTime!
            } else {
                return $0.startTime! > $1.startTime!
            }
        })
    }
    
    func getDisciplineLessonsNames(rowLesson: Lesson) -> String {
        disciplineLessonsNames = [String]()
        if let startTime = rowLesson.startTime {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let lessonDate = dateFormatter.string(from: startTime.convertToDate())
            return "Aula - \(lessonDate)"
        } else {
            return "Aula - Indefinida"
        }
    }
    
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
}
