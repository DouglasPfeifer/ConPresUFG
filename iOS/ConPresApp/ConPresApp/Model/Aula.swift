//
//  Aula.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 02/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation

class Aula {
    var disciplina: String?
    var turma: String?
    var docente: String?
    var local: String?
    var horario: String?
    
    init(disciplina: String?, turma: String?, docente: String?, local: String?, horario: String?) {
        self.disciplina = disciplina
        self.turma = turma
        self.docente = docente
        self.local = local
        self.horario = horario
    }
}
