//
//  NetworkManager.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 21/12/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation
import Moya

protocol Networkable {
    var provider: MoyaProvider<NetworkingService> { get }
    
    func getUser(userID: Int, completion: @escaping (Lesson?, Error?) -> ())
    func getUserLessons(userID: Int, completion: @escaping ([Lesson]?, Error?) -> ())
    func getUserLesson(userID: Int, completion: @escaping (Lesson?, Error?) -> ())
    func getUserDisciplines(userID: Int, completion: @escaping (Discipline?, Error?) -> ())
}


class NetworkManager: Networkable {
    
    var provider = MoyaProvider<NetworkingService>()

    func getUser(userID: Int, completion: @escaping (Lesson?, Error?) -> ()) {
        provider.request(.getUser(userID: userID)) {
            (response) in
            switch response {
            case .failure(let error):
                completion(nil, error)
            case .success(let value):
                let decoder = JSONDecoder()
                do {
                    let lessons = try decoder.decode(Lesson.self, from: value.data)
                    completion(lessons, nil)
                } catch let error {
                    completion(nil, error)
                }
            }
        }
    }
    
    func getUserLessons(userID: Int, completion: @escaping ([Lesson]?, Error?) -> ()) {
        provider.request(.getUserLessons(userID: userID)) {
            (response) in
            switch response {
            case .failure(let error):
                completion(nil, error)
            case .success(let value):
                let decoder = JSONDecoder()
                do {
                    let lessons = try decoder.decode([Lesson].self, from: value.data)
                    completion(lessons, nil)
                } catch let error {
                    completion(nil, error)
                }
            }
        }
    }
    
    func getUserLesson(userID: Int, completion: @escaping (Lesson?, Error?) -> ()) {
        provider.request(.getUserLesson(userID: userID)) {
            (response) in
            switch response {
            case .failure(let error):
                completion(nil, error)
            case .success(let value):
                let decoder = JSONDecoder()
                do {
                    let lesson = try decoder.decode(Lesson.self, from: value.data)
                    completion(lesson, nil)
                } catch let error {
                    completion(nil, error)
                }
            }
        }
    }
    
    func getUserDisciplines(userID: Int, completion: @escaping (Discipline?, Error?) -> ()) {
        provider.request(.getUserDisciplines(userID: userID)) {
            (response) in
            switch response {
            case .failure(let error):
                completion(nil, error)
            case .success(let value):
                let decoder = JSONDecoder()
                do {
                    let discipline = try decoder.decode(Discipline.self, from: value.data)
                    completion(discipline, nil)
                } catch let error {
                    completion(nil, error)
                }
            }
        }
    }
}
