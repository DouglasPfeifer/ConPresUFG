//
//  LecturerDisciplineAttendanceViewModel.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 20/12/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation

class LecturerDisciplineAttendanceViewModel: BaseViewModel {
    
    // MARK: Properties
    var mock: Mock!

    var currentDiscipline: Discipline!
    var disciplineLessons: [Lesson]!
    var disciplineLessonsNames: [String]!
    var selectedLesson: Lesson?
    
    var numberOfLessons: Int!
    let totalNumberOfLessons = 30
    
    // MARK: Initializer
    init(currentDiscipline: Discipline) {
        super.init()
        mock = Mock(userType: userType)
        
        self.currentDiscipline = currentDiscipline
        setDisciplineLessons()
        sortDisciplinesLessons()
    }
    
    // MARK: Internal Methods
    private func setDisciplineLessons() {
        disciplineLessons = [Lesson]()
        numberOfLessons = 0
        
        for lesson in mock.lessons {
            if lesson.discipline == currentDiscipline.name {
                disciplineLessons.append(lesson)
                numberOfLessons += 1
            }
        }
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
    
    func setSelectedLesson(row: Int) {
        selectedLesson = disciplineLessons[row]
    }
    
    func sendToSIGAA() {
        
    }
}
