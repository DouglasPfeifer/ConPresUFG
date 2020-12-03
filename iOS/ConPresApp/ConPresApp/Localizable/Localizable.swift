//
//  Localizable.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 26/06/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation

enum Localizable {
    
    // MARK: Menu
    enum Menu {
        static let checkAttendance = "Consultar sua frequência"
        static let studentsAttendance = "Frequência dos discentes"
        static let sendToSIGAA = "Enviar para o SIGAA"
        static let lecturersAttendance = "Frequência dos docentes"
        static let offerClass = "Ofertar Turma"
        static let addCalendar = "Adicionar Calendário"
        static let addDiscipline = "Adicionar Disciplina"
        static let addLecturer = "Adicionar Docente"
        static let addClassroom = "Adicionar Sala"
    }
    
    // MARK: Time
    enum DaysOfTheWeek {
        static let sunday = "Domingo"
        static let monday = "Segunda"
        static let tuesdday = "Terça"
        static let wednesday = "Quarta"
        static let thursday = "Quinta"
        static let friday = "Sexta"
        static let saturday = "Sábado"
    }
    
    enum PeriodsOfTheDay {
        static let morning = "Manhã"
        static let afternoon = "Tarde"
        static let night = "Noite"
    }
    
    enum MorningHours {
        static let one = "7:10"
        static let two = "8:00"
        static let three = "8:50"
        static let four = "10:00"
        static let five = "10:50"
        static let six = "12:00"
    }
    
    enum AfternoonHours {
        static let one = "13:10"
        static let two = "14:00"
        static let three = "14:50"
        static let four = "16:00"
        static let five = "16:50"
        static let six = "17:00"
    }
    
    enum NightHours {
        static let one = "18:05"
        static let two = "18:50"
        static let three = "19:35"
        static let four = "20:30"
        static let five = "21:15"
    }
}
