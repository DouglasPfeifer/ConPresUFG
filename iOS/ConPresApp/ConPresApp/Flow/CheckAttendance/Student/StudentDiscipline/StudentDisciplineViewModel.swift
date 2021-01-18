//
//  StudentDisciplineViewModel.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 03/12/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation

class StudentDisciplineViewModel: BaseViewModel {
    
    // MARK: Properties
    var mock: Mock!
    var studentDisciplines: [String?]?
    var selectedDiscipline: String?
    var lessons: [Lesson]?
    
    // MARK: Initializer
    override init() {
        super.init()
//        mock = Mock(userType: userType)
        if let lessonsArray = UserDefaults.standard.data(forKey: "studentLessonsArray") {
            do {
                lessons = try JSONDecoder().decode([Lesson].self, from: lessonsArray)
            } catch {
                print("asd erro")
            }
        }
        
        setDisciplines()
    }
    
    // MARK: Internal methods
    private func setDisciplines() {
        studentDisciplines = [String]()
        
        for studentLesson in lessons! {
            guard let discipline = studentLesson.discipline else { continue }
            if !studentDisciplines!.contains(discipline) {
                studentDisciplines!.append(discipline)
            }
        }
    }
    
    func setSelectedDiscipline(row: Int) {
        guard let disciplines = studentDisciplines,
              let discipline = disciplines[row] else { return }
        selectedDiscipline = discipline
    }
    
    // MARK: HTTP Requests
    func getUserDisciplines(completion: @escaping (Bool) -> ()) {
        let id = 1
        networkManager.getUserLessons(userID: id, completion: {
            (lessons, error) in
            if let error = error {
                completion(false)
                return
            }
            dump(lessons)
//            self.lessons = lessons
            completion(true)
        })
    }
}
