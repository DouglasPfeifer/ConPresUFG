//
//  AddLessonViewModel.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 16/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation

class AddLessonViewModel: BaseViewModel {
    
    // MARK: Properties
    var mock: Mock!
    var disciplines: [Discipline]!
    
    // MARK: Initializer
    override init() {
        super.init()
        mock = Mock(userType: userType)
        
        setDisciplines()
    }
    
    private func setDisciplines() {
        disciplines = [Discipline]()
        for discipline in mock.lecturerDisciplines {
            disciplines.append(discipline)
        }
    }
    
    func getLessonOfDiscipline(discipline: Discipline) -> Lesson? {
        for lesson in mock.lessons {
            if discipline.name == lesson.discipline {
                return lesson
            }
        }
        return nil
    }
}
