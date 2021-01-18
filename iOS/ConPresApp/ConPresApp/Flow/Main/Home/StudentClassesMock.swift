//
//  HomeMock.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 22/11/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation

class Mock {
    
    // General properties
    var lessons: [Lesson]!
    
    // Student properties
    var studentDisciplineName: String!
    var lecturer: String!
    var studentClassroom: String!
    
    // Lecturer properties
    var lecturerDisciplines: [Discipline]!
    var lecturerDisciplineName: String!
    var lecturerClassroom: String!
    
    init(userType: Int) {
        switch userType {
        case UserTypes.student.rawValue:
            lessons = getStudentLessons()
        case UserTypes.lecturer.rawValue:
            lessons = getLecturerLessons()
            lecturerDisciplines = getLecturerDisciplines()
        default:
            lessons = getStudentLessons()
            lecturerDisciplines = getLecturerDisciplines()
        }
    }
    
    // MARK: - General
    func getLessons(userType: Int) -> [Lesson] {
        switch userType {
        case UserTypes.student.rawValue:
            lessons = getStudentLessons()
        case UserTypes.lecturer.rawValue:
            lessons = getLecturerLessons()
        default:
            lessons = getStudentLessons()
        }
        return lessons
    }
    
    // MARK: - Student
    func getStudentLessons() -> [Lesson] {
        var lessons = [Lesson]()
        for discipline in 0...2 {
            for lesson in 0...34 {
                if discipline == 0 {
                    studentDisciplineName = "Engenharia de requisitos"
                    lecturer = "João da Silva"
                } else if discipline == 1 {
                    studentDisciplineName = "Programação Orientada a Objetos"
                    lecturer = "Roberto Carlos"
                } else {
                    studentDisciplineName = "Banco de Dados"
                    lecturer = "José Marinho"
                }
                if lesson % 2 == 0 {
                    studentClassroom = "Campus Samambaia - CAB 201"
                } else {
                    studentClassroom = "Campus Samambaia - CAB 202"
                }
                let newLesson = Lesson(id: (discipline + lesson),
                                       attendance: 1,
                                       discipline: studentDisciplineName,
                                       lecturer: lecturer,
                                       classroom: studentClassroom,
                                       startTime: "2021-04-14T10:00:00+0000",
                                       endTime: "2021-04-14T11:40:00+0000",
                                       password: "Password \(discipline)-\(lesson)",
                                       latitude: -16.68026407358496,
                                       longitude: -49.25654600895208,
                                       lecturerStudents: nil)
                lessons.append(newLesson)
            }
        }
        return lessons
    }
    
    // MARK: - Lecturer
    func getLecturerLessons() -> [Lesson] {
        var lessons = [Lesson]()
        for lesson in 0...2 {
            if lesson == 0 {
                studentDisciplineName = "Engenharia de requisitos"
                lecturer = "João da Silva"
                studentClassroom = "Campus Samambaia - CAB 201"
            } else if lesson == 1 {
                studentDisciplineName = "Programação Orientada a Objetos"
                lecturer = "João da Silva"
                studentClassroom = "Campus Samambaia - CAB 202"
            } else {
                studentDisciplineName = "Banco de Dados"
                lecturer = "João da Silva"
                studentClassroom = "Campus Samambaia - CAB 203"
            }
            
            var lecturerStudents = [LecturerStudent]()
            for index in 0...39 {
                let newLecturerStudent = LecturerStudent(id: "\(index)",
                                                         name: "StudentName StudentSurname StudentLastName \(index)",
                                                         attendance: true)
                lecturerStudents.append(newLecturerStudent)
            }
            
            let newLesson = Lesson(id: lesson,
                                   attendance: 1,
                                   discipline: studentDisciplineName,
                                   lecturer: lecturer,
                                   classroom: studentClassroom,
                                   startTime: "2021-04-14T10:00:00+0000",
                                   endTime: "2021-04-14T11:40:00+0000",
                                   password: "Password \(lesson)-\(lesson)",
                                   latitude: -16.68026407358496,
                                   longitude: -49.25654600895208,
                                   lecturerStudents: lecturerStudents)
            lessons.append(newLesson)
        }
        return lessons
    }
    
    func getLecturerDisciplines() -> [Discipline] {
        var disciplines = [Discipline]()
        for discipline in 0...2 {
            if discipline == 0 {
                lecturerDisciplineName = "Engenharia de requisitos"
                lecturerClassroom = "CAB 201"
            } else if discipline == 1 {
                lecturerDisciplineName = "Programação Orientada a Objetos"
                lecturerClassroom = "CAB 202"
            } else {
                lecturerDisciplineName = "Banco de Dados"
                lecturerClassroom = "CAB 203"
            }
            let newDiscipline = Discipline(code: discipline,
                                           schedule: "Schedule \(discipline)",
                                           name: lecturerDisciplineName,
                                           classroom: lecturerClassroom,
                                           startTime: "2021-04-14T10:00:00+0000",
                                           endTime: "2021-04-14T11:40:00+0000",
                                           password: nil,
                                           latitude: -16.68026407358496,
                                           longitude: -49.25654600895208,
                                           lecturerStudents: [LecturerStudent(id: "30", name: "Leia Lobo Falcão", attendance: false),
                                                              LecturerStudent(id: "31", name: "Milena Figueira", attendance: false),
                                                              LecturerStudent(id: "32", name: "Amina Cantanhede Cancela", attendance: false),
                                                              LecturerStudent(id: "33", name: "Cecília Barros Brites", attendance: false),
                                                              LecturerStudent(id: "34", name: "Oséias Regodeiro Jorge", attendance: false),
                                                              LecturerStudent(id: "35", name: "Josiane Aguiar Neiva", attendance: false),
                                                              LecturerStudent(id: "36", name: "Gustavo Novais Almeida", attendance: false),
                                                              LecturerStudent(id: "37", name: "Jayson Anjos Nazário", attendance: false),
                                                              LecturerStudent(id: "38", name: "Sofia Vasques Monte", attendance: false),
                                                              LecturerStudent(id: "39", name: "George Arruda Covilhã", attendance: false)
                                           ])
            disciplines.append(newDiscipline)
        }
        return disciplines
    }
}

// MARK: True mock
final class Manager {
    static let shared = Manager()
    
    var lecturerLessons: [Lesson]?
    var studentLessons: [Lesson]?

    private init() {
        // MARK: Student
        var mockStudentLessons = [Lesson]()
        for index in 1...18 {
            var startTime = ""
            var endTime = ""
            if index < 10 {
                startTime = "2021-01-0\(index)T10:00:00.000000"
                endTime = "2021-01-0\(index)T11:40:00.000000"
            } else {
                startTime = "2021-01-\(index)T10:00:00.000000"
                endTime = "2021-01-\(index)T11:40:00.000000"
            }
            
            mockStudentLessons.append(
                Lesson(id: index,
                       attendance: 1,
                       discipline: "Engenharia de Requisitos",
                       lecturer: "Erika Paulos Moura",
                       classroom: "Campus Samambaia - CAB 201",
                       startTime: startTime,
                       endTime: endTime,
                       password: "password123",
                       latitude: -16.60314893176627,
                       longitude: -49.26572670508183,
                       lecturerStudents: [LecturerStudent(id: "30", name: "Leia Lobo Falcão", attendance: false),
                                          LecturerStudent(id: "31", name: "Milena Figueira", attendance: false),
                                          LecturerStudent(id: "32", name: "Amina Cantanhede Cancela", attendance: false),
                                          LecturerStudent(id: "33", name: "Cecília Barros Brites", attendance: false),
                                          LecturerStudent(id: "34", name: "Oséias Regodeiro Jorge", attendance: false),
                                          LecturerStudent(id: "35", name: "Josiane Aguiar Neiva", attendance: false),
                                          LecturerStudent(id: "36", name: "Gustavo Novais Almeida", attendance: false),
                                          LecturerStudent(id: "37", name: "Jayson Anjos Nazário", attendance: false),
                                          LecturerStudent(id: "38", name: "Sofia Vasques Monte", attendance: false),
                                          LecturerStudent(id: "39", name: "George Arruda Covilhã", attendance: false)
                       ]
                )
            )
            
            if index < 10 {
                startTime = "2021-01-0\(index)T08:00:00.000000"
                endTime = "2021-01-0\(index)T09:40:00.000000"
            } else {
                startTime = "2021-01-\(index)T08:00:00.000000"
                endTime = "2021-01-\(index)T09:40:00.000000"
            }
            mockStudentLessons.append(
                Lesson(id: (20 + index),
                       attendance: 1,
                       discipline: "Teoria dos Grafos",
                       lecturer: "Júlio Torreiro Saldanha",
                       classroom: "Campus Samambaia - CAB 107",
                       startTime: startTime,
                       endTime: endTime,
                       password: "password123",
                       latitude: -16.60314893176627,
                       longitude: -49.26572670508183,
                       lecturerStudents: [LecturerStudent(id: "20", name: "Lisandra Bentes Berenguer", attendance: false),
                                          LecturerStudent(id: "21", name: "Hossana Trindade Cadaval", attendance: false),
                                          LecturerStudent(id: "22", name: "Bilal Afonso Atilano", attendance: false),
                                          LecturerStudent(id: "23", name: "Magda Penha Quinaz", attendance: false),
                                          LecturerStudent(id: "24", name: "Aya Moreno Neres", attendance: false),
                                          LecturerStudent(id: "25", name: "Taynara Liberato Barbosa", attendance: false),
                                          LecturerStudent(id: "26", name: "Andra Rijo Reis", attendance: false),
                                          LecturerStudent(id: "27", name: "Esperança Garrau Lira", attendance: false),
                                          LecturerStudent(id: "28", name: "Yaqi Atilano Canela", attendance: false),
                                          LecturerStudent(id: "29", name: "Katerina Gouveia Covilhã", attendance: false)
                       ]
                )
            )
            
            if index < 10 {
                startTime = "2021-01-0\(index)T06:00:00.000000"
                endTime = "2021-01-0\(index)T07:40:00.000000"
            } else {
                startTime = "2021-01-\(index)T06:00:00.000000"
                endTime = "2021-01-\(index)T07:40:00.000000"
            }
            mockStudentLessons.append(
                Lesson(id: (40 + index),
                       attendance: 0,
                       discipline: "Cáculo 1A",
                       lecturer: "António Charneca Melgaço",
                       classroom: "Campus Samambaia - CAB 101",
                       startTime: startTime,
                       endTime: endTime,
                       password: "password123",
                       latitude: -16.60314893176627,
                       longitude: -49.26572670508183,
                       lecturerStudents: [LecturerStudent(id: "10", name: "Jasmeet Café Sesimbra", attendance: false),
                                          LecturerStudent(id: "11", name: "Nadine Barroqueiro Salgado", attendance: false),
                                          LecturerStudent(id: "12", name: "Gastão Queiroga Anjos", attendance: false),
                                          LecturerStudent(id: "13", name: "Cristiana Leme Severiano", attendance: false),
                                          LecturerStudent(id: "14", name: "Édi Viegas Morais", attendance: false),
                                          LecturerStudent(id: "15", name: "Simona Guedes Leal", attendance: false),
                                          LecturerStudent(id: "16", name: "Jéssica Cordeiro Prestes", attendance: false),
                                          LecturerStudent(id: "17", name: "Osvaldo Semedo Quaresma", attendance: false),
                                          LecturerStudent(id: "18", name: "Luiz Alcoforado Zambujal", attendance: false),
                                          LecturerStudent(id: "19", name: "Rúbia Pastana Lamenha", attendance: false)
                       ]
                )
            )
        }
        
        mockStudentLessons.append(
            Lesson(id: 0,
                   attendance: 2,
                   discipline: "Engenharia de Requisitos",
                   lecturer: "Erika Paulos Moura",
                   classroom: "Campus Samambaia - CAB 201",
                   startTime: "2021-01-19T10:00:00.000000",
                   endTime: "2021-01-19T11:40:00.000000",
                   password: "password123",
                   latitude: -16.60314893176627,
                   longitude: -49.26572670508183,
                   lecturerStudents: [LecturerStudent(id: "30", name: "Leia Lobo Falcão", attendance: false),
                                      LecturerStudent(id: "31", name: "Milena Figueira", attendance: false),
                                      LecturerStudent(id: "32", name: "Amina Cantanhede Cancela", attendance: false),
                                      LecturerStudent(id: "33", name: "Cecília Barros Brites", attendance: false),
                                      LecturerStudent(id: "34", name: "Oséias Regodeiro Jorge", attendance: false),
                                      LecturerStudent(id: "35", name: "Josiane Aguiar Neiva", attendance: false),
                                      LecturerStudent(id: "36", name: "Gustavo Novais Almeida", attendance: false),
                                      LecturerStudent(id: "37", name: "Jayson Anjos Nazário", attendance: false),
                                      LecturerStudent(id: "38", name: "Sofia Vasques Monte", attendance: false),
                                      LecturerStudent(id: "39", name: "George Arruda Covilhã", attendance: false)
                   ]
            )
        )
        mockStudentLessons.append(
            Lesson(id: 20,
                   attendance: 1,
                   discipline: "Teoria dos Grafos",
                   lecturer: "Júlio Torreiro Saldanha",
                   classroom: "Campus Samambaia - CAB 107",
                   startTime: "2021-01-19T08:00:00.000000",
                   endTime: "2021-01-19T09:40:00.000000",
                   password: "password123",
                   latitude: -16.60314893176627,
                   longitude: -49.26572670508183,
                   lecturerStudents: [LecturerStudent(id: "20", name: "Lisandra Bentes Berenguer", attendance: false),
                                      LecturerStudent(id: "21", name: "Hossana Trindade Cadaval", attendance: false),
                                      LecturerStudent(id: "22", name: "Bilal Afonso Atilano", attendance: false),
                                      LecturerStudent(id: "23", name: "Magda Penha Quinaz", attendance: false),
                                      LecturerStudent(id: "24", name: "Aya Moreno Neres", attendance: false),
                                      LecturerStudent(id: "25", name: "Taynara Liberato Barbosa", attendance: false),
                                      LecturerStudent(id: "26", name: "Andra Rijo Reis", attendance: false),
                                      LecturerStudent(id: "27", name: "Esperança Garrau Lira", attendance: false),
                                      LecturerStudent(id: "28", name: "Yaqi Atilano Canela", attendance: false),
                                      LecturerStudent(id: "29", name: "Katerina Gouveia Covilhã", attendance: false)
                   ]
            )
        )
        mockStudentLessons.append(
            Lesson(id: 40,
                   attendance: 0,
                   discipline: "Cáculo 1A",
                   lecturer: "António Charneca Melgaço",
                   classroom: "Campus Samambaia - CAB 101",
                   startTime: "2021-01-19T06:00:00.000000",
                   endTime: "2021-01-19T07:40:00.000000",
                   password: "password123",
                   latitude: -16.60314893176627,
                   longitude: -49.26572670508183,
                   lecturerStudents: [LecturerStudent(id: "10", name: "Jasmeet Café Sesimbra", attendance: false),
                                      LecturerStudent(id: "11", name: "Nadine Barroqueiro Salgado", attendance: false),
                                      LecturerStudent(id: "12", name: "Gastão Queiroga Anjos", attendance: false),
                                      LecturerStudent(id: "13", name: "Cristiana Leme Severiano", attendance: false),
                                      LecturerStudent(id: "14", name: "Édi Viegas Morais", attendance: false),
                                      LecturerStudent(id: "15", name: "Simona Guedes Leal", attendance: false),
                                      LecturerStudent(id: "16", name: "Jéssica Cordeiro Prestes", attendance: false),
                                      LecturerStudent(id: "17", name: "Osvaldo Semedo Quaresma", attendance: false),
                                      LecturerStudent(id: "18", name: "Luiz Alcoforado Zambujal", attendance: false),
                                      LecturerStudent(id: "19", name: "Rúbia Pastana Lamenha", attendance: false)
                   ]
            )
        )
        studentLessons = mockStudentLessons.sorted(by: {
            $0.startTime! < $1.startTime!
        })
        
        // MARK: Lecturer
        var mockLecturerLessons = [Lesson]()
        for index in 1...18 {
            var startTime = ""
            var endTime = ""
            if index < 10 {
                startTime = "2021-01-0\(index)T10:00:00.000000"
                endTime = "2021-01-0\(index)T11:40:00.000000"
            } else {
                startTime = "2021-01-\(index)T10:00:00.000000"
                endTime = "2021-01-\(index)T11:40:00.000000"
            }
            
            mockLecturerLessons.append(
                Lesson(id: index,
                       attendance: 1,
                       discipline: "Engenharia de Requisitos",
                       lecturer: "António Charneca Melgaço",
                       classroom: "Campus Samambaia - CAB 201",
                       startTime: startTime,
                       endTime: endTime,
                       password: "password123",
                       latitude: -16.60314893176627,
                       longitude: -49.26572670508183,
                       lecturerStudents: [LecturerStudent(id: "30", name: "Leia Lobo Falcão", attendance: false),
                                          LecturerStudent(id: "31", name: "Milena Figueira", attendance: false),
                                          LecturerStudent(id: "32", name: "Amina Cantanhede Cancela", attendance: false),
                                          LecturerStudent(id: "33", name: "Cecília Barros Brites", attendance: false),
                                          LecturerStudent(id: "34", name: "Oséias Regodeiro Jorge", attendance: false),
                                          LecturerStudent(id: "35", name: "Josiane Aguiar Neiva", attendance: false),
                                          LecturerStudent(id: "36", name: "Gustavo Novais Almeida", attendance: false),
                                          LecturerStudent(id: "37", name: "Jayson Anjos Nazário", attendance: false),
                                          LecturerStudent(id: "38", name: "Sofia Vasques Monte", attendance: false),
                                          LecturerStudent(id: "39", name: "George Arruda Covilhã", attendance: false)
                       ]
                )
            )
            
            if index < 10 {
                startTime = "2021-01-0\(index)T08:00:00.000000"
                endTime = "2021-01-0\(index)T09:40:00.000000"
            } else {
                startTime = "2021-01-\(index)T08:00:00.000000"
                endTime = "2021-01-\(index)T09:40:00.000000"
            }
            mockLecturerLessons.append(
                Lesson(id: (20 + index),
                       attendance: 1,
                       discipline: "Teoria dos Grafos",
                       lecturer: "António Charneca Melgaço",
                       classroom: "Campus Samambaia - CAB 107",
                       startTime: startTime,
                       endTime: endTime,
                       password: "password123",
                       latitude: -16.60314893176627,
                       longitude: -49.26572670508183,
                       lecturerStudents: [LecturerStudent(id: "20", name: "Lisandra Bentes Berenguer", attendance: false),
                                          LecturerStudent(id: "21", name: "Hossana Trindade Cadaval", attendance: false),
                                          LecturerStudent(id: "22", name: "Bilal Afonso Atilano", attendance: false),
                                          LecturerStudent(id: "23", name: "Magda Penha Quinaz", attendance: false),
                                          LecturerStudent(id: "24", name: "Aya Moreno Neres", attendance: false),
                                          LecturerStudent(id: "25", name: "Taynara Liberato Barbosa", attendance: false),
                                          LecturerStudent(id: "26", name: "Andra Rijo Reis", attendance: false),
                                          LecturerStudent(id: "27", name: "Esperança Garrau Lira", attendance: false),
                                          LecturerStudent(id: "28", name: "Yaqi Atilano Canela", attendance: false),
                                          LecturerStudent(id: "29", name: "Katerina Gouveia Covilhã", attendance: false)
                       ]
                )
            )
            
            if index < 10 {
                startTime = "2021-01-0\(index)T06:00:00.000000"
                endTime = "2021-01-0\(index)T07:40:00.000000"
            } else {
                startTime = "2021-01-\(index)T06:00:00.000000"
                endTime = "2021-01-\(index)T07:40:00.000000"
            }
            mockLecturerLessons.append(
                Lesson(id: (40 + index),
                       attendance: 1,
                       discipline: "Cáculo 1A",
                       lecturer: "António Charneca Melgaço",
                       classroom: "Campus Samambaia - CAB 101",
                       startTime: startTime,
                       endTime: endTime,
                       password: "password123",
                       latitude: -16.60314893176627,
                       longitude: -49.26572670508183,
                       lecturerStudents: [LecturerStudent(id: "10", name: "Jasmeet Café Sesimbra", attendance: false),
                                          LecturerStudent(id: "11", name: "Nadine Barroqueiro Salgado", attendance: false),
                                          LecturerStudent(id: "12", name: "Gastão Queiroga Anjos", attendance: false),
                                          LecturerStudent(id: "13", name: "Cristiana Leme Severiano", attendance: false),
                                          LecturerStudent(id: "14", name: "Édi Viegas Morais", attendance: false),
                                          LecturerStudent(id: "15", name: "Simona Guedes Leal", attendance: false),
                                          LecturerStudent(id: "16", name: "Jéssica Cordeiro Prestes", attendance: false),
                                          LecturerStudent(id: "17", name: "Osvaldo Semedo Quaresma", attendance: false),
                                          LecturerStudent(id: "18", name: "Luiz Alcoforado Zambujal", attendance: false),
                                          LecturerStudent(id: "19", name: "Rúbia Pastana Lamenha", attendance: false)
                       ]
                )
            )
        }
        
//        mockLecturerLessons.append(
//            Lesson(id: 0,
//                   attendance: 2,
//                   discipline: "Engenharia de Requisitos",
//                   lecturer: "Erika Paulos Moura",
//                   classroom: "Campus Samambaia - CAB 201",
//                   startTime: "2021-01-19T10:00:00.000000",
//                   endTime: "2021-01-19T11:40:00.000000",
//                   password: "password123",
//                   latitude: -16.60314893176627,
//                   longitude: -49.26572670508183,
//                   lecturerStudents: [LecturerStudent(id: "30", name: "Leia Lobo Falcão", attendance: false),
//                                      LecturerStudent(id: "31", name: "Milena Figueira", attendance: false),
//                                      LecturerStudent(id: "32", name: "Amina Cantanhede Cancela", attendance: false),
//                                      LecturerStudent(id: "33", name: "Cecília Barros Brites", attendance: false),
//                                      LecturerStudent(id: "34", name: "Oséias Regodeiro Jorge", attendance: false),
//                                      LecturerStudent(id: "35", name: "Josiane Aguiar Neiva", attendance: false),
//                                      LecturerStudent(id: "36", name: "Gustavo Novais Almeida", attendance: false),
//                                      LecturerStudent(id: "37", name: "Jayson Anjos Nazário", attendance: false),
//                                      LecturerStudent(id: "38", name: "Sofia Vasques Monte", attendance: false),
//                                      LecturerStudent(id: "39", name: "George Arruda Covilhã", attendance: false)
//                   ]
//            )
//        )
        mockLecturerLessons.append(
            Lesson(id: 20,
                   attendance: 1,
                   discipline: "Teoria dos Grafos",
                   lecturer: "António Charneca Melgaço",
                   classroom: "Campus Samambaia - CAB 107",
                   startTime: "2021-01-19T08:00:00.000000",
                   endTime: "2021-01-19T09:40:00.000000",
                   password: "password123",
                   latitude: -16.60314893176627,
                   longitude: -49.26572670508183,
                   lecturerStudents: [LecturerStudent(id: "20", name: "Lisandra Bentes Berenguer", attendance: false),
                                      LecturerStudent(id: "21", name: "Hossana Trindade Cadaval", attendance: false),
                                      LecturerStudent(id: "22", name: "Bilal Afonso Atilano", attendance: false),
                                      LecturerStudent(id: "23", name: "Magda Penha Quinaz", attendance: false),
                                      LecturerStudent(id: "24", name: "Aya Moreno Neres", attendance: false),
                                      LecturerStudent(id: "25", name: "Taynara Liberato Barbosa", attendance: false),
                                      LecturerStudent(id: "26", name: "Andra Rijo Reis", attendance: false),
                                      LecturerStudent(id: "27", name: "Esperança Garrau Lira", attendance: false),
                                      LecturerStudent(id: "28", name: "Yaqi Atilano Canela", attendance: false),
                                      LecturerStudent(id: "29", name: "Katerina Gouveia Covilhã", attendance: false)
                   ]
            )
        )
        mockLecturerLessons.append(
            Lesson(id: 40,
                   attendance: 1,
                   discipline: "Cáculo 1A",
                   lecturer: "António Charneca Melgaço",
                   classroom: "Campus Samambaia - CAB 101",
                   startTime: "2021-01-19T06:00:00.000000",
                   endTime: "2021-01-19T07:40:00.000000",
                   password: "password123",
                   latitude: -16.60314893176627,
                   longitude: -49.26572670508183,
                   lecturerStudents: [LecturerStudent(id: "10", name: "Jasmeet Café Sesimbra", attendance: false),
                                      LecturerStudent(id: "11", name: "Nadine Barroqueiro Salgado", attendance: false),
                                      LecturerStudent(id: "12", name: "Gastão Queiroga Anjos", attendance: false),
                                      LecturerStudent(id: "13", name: "Cristiana Leme Severiano", attendance: false),
                                      LecturerStudent(id: "14", name: "Édi Viegas Morais", attendance: false),
                                      LecturerStudent(id: "15", name: "Simona Guedes Leal", attendance: false),
                                      LecturerStudent(id: "16", name: "Jéssica Cordeiro Prestes", attendance: false),
                                      LecturerStudent(id: "17", name: "Osvaldo Semedo Quaresma", attendance: false),
                                      LecturerStudent(id: "18", name: "Luiz Alcoforado Zambujal", attendance: false),
                                      LecturerStudent(id: "19", name: "Rúbia Pastana Lamenha", attendance: false)
                   ]
            )
        )
        lecturerLessons = mockLecturerLessons.sorted(by: {
            $0.startTime! < $1.startTime!
        })
    }
}
