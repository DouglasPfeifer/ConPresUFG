//
//  AddLessonViewModel.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 16/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation

class AddLessonViewModel: BaseViewModel {
    
    // MARK: Mock
    
    // MARK: Properties
//    var mock: Mock!
    var disciplines: [Discipline]!
    var lessons: [Lesson]?
    
    // MARK: Initializer
    override init() {
        super.init()
        
        disciplines = [Discipline]()
        
//        mock = Mock(userType: userType)
        
        let hasLoaded = UserDefaults.standard.bool(forKey: "hasLoadedLecturer")
        if hasLoaded {
            if let lessonsArray = UserDefaults.standard.data(forKey: "lecturerLessonsArray") {
                do {
                    lessons = try JSONDecoder().decode([Lesson].self, from: lessonsArray)
                } catch {
                    print("asd erro")
                }
            }
        } else {
            lessons = Manager.shared.lecturerLessons
            do {
                let lessonsArray = try JSONEncoder().encode(lessons)
                UserDefaults.standard.set(lessonsArray, forKey: "lecturerLessonsArray")
            } catch {
                print("asd erro")
            }
            UserDefaults.standard.set(true, forKey: "hasLoadedLecturer")
        }
        
        setDisciplines()
    }
    
    private func setDisciplines() {
        let hasAddedLesson = UserDefaults.standard.bool(forKey: "hasAddedLesson")
        if !hasAddedLesson {
            disciplines.append(Discipline(code: 0,
                                          schedule: "",
                                          name: "Engenharia de Requisitos",
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
                                          ]))
        }
    }
    
    func getLessonOfDiscipline(discipline: Discipline) -> Lesson? {
        print("asd id: ", lessons!.count + 10)
        return Lesson(id: (lessons?.count ?? 100) + 10,
                      attendance: 2,
                      discipline: discipline.name,
                      lecturer: "António Charneca Melgaço",
                      classroom: discipline.classroom,
                      startTime: discipline.startTime,
                      endTime: discipline.endTime,
                      password: discipline.password,
                      latitude: discipline.latitude,
                      longitude: discipline.longitude,
                      lecturerStudents: discipline.lecturerStudents)
    }
}
