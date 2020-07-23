//
//  Discipline.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 23/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation

/// Disciplina
class Discipline {
    var ID: String?
    var name: String?
    var workload: Int?
    var code: String?
    
    init(ID: String?, name: String?, workload: Int?, code: String?) {
        self.ID = ID
        self.name = name
        self.workload = workload
        self.code = code
    }
}
