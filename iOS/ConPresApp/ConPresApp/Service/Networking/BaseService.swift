//
//  BaseService.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 16/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation
import Moya

class BaseService {
    
    // MARK: Variables
    var baseURL: URL
    
    // MARK: Initializer
    init(baseURL: URL) {
        self.baseURL = baseURL
    }
}
