//
//  NetworkingService.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 16/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation
import Moya

enum NetworkingService {
    // User
    case getUser(userID: Int)
    case getUserLessons(userID: Int)
    case getUserLesson(userID: Int)
    case getUserDisciplines(userID: Int)
}

// MARK: - TargetType Protocol Implementation
extension NetworkingService: TargetType {
    var baseURL: URL { return URL(string: "https://conpres-api.herokuapp.com/api/v1")! }
    var path: String {
        switch self {
        case .getUser(let id):
            return "/Academicos/\(id)"
        case .getUserLessons(let id):
            return "/Academicos/\(id)/Aulas"
        case .getUserLesson(let id):
            return "/Aulas/\(id)"
        case .getUserDisciplines(let id):
            return "/Academicos/\(id)/Turmas"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUser,
             .getUserLessons,
             .getUserLesson,
             .getUserDisciplines:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getUser,
             .getUserLessons,
             .getUserLesson,
             .getUserDisciplines: // Send no parameters
            return .requestPlain
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getUser(let id),
             .getUserLessons(let id),
             .getUserLesson(let id),
             .getUserDisciplines(let id):
            return "{\"id\": \(id), \"first_name\": \"Harry\", \"last_name\": \"Potter\"}".utf8Encoded
        }
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}

// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
