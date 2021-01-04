//
//  LecturerDisciplineViewModel.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 20/12/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation

class LecturerDisciplineViewModel: BaseViewModel {
    
    // MARK: Properties
    var mock: Mock!
    var lecturerDisciplines: [Discipline]!
    var selectedDiscipline: Discipline?
    
    // MARK: Initializer
    override init() {
        super.init()
        mock = Mock(userType: userType)
        
        setDisciplines()
    }
    
    // MARK: Internal methods
    private func setDisciplines() {
        lecturerDisciplines = mock.lecturerDisciplines
    }
    
    func setSelectedDiscipline(row: Int) {
        selectedDiscipline = lecturerDisciplines[row]
    }
}
