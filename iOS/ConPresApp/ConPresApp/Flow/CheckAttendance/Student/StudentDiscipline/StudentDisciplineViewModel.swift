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
    
    // MARK: Initializer
    override init() {
        super.init()
        mock = Mock(userType: userType)
        
        setDisciplines()
    }
    
    // MARK: Internal methods
    private func setDisciplines() {
        studentDisciplines = [String]()
        
        for studentLesson in mock.lessons {
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
