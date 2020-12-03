//
//  StudentDisciplineViewModel.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 03/12/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation

class StudentDisciplineViewModel: BaseViewModel {
    var studentClasses = StudentClassesMock().mockStudentClass
    
    override init() {
        super.init()
        
        sortClasses()
    }
    
    private func sortClasses() {
        studentClasses = studentClasses.sorted(by: {
            if $0.discipline != $1.discipline { // first, compare by last names
                return $0.discipline! < $1.discipline!
            } else {
                return $0.startDate! < $1.startDate!
            }
        })
    }
}
