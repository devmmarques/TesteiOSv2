//
//  API.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 17/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import Foundation

struct API {
    enum Path {
        case doLogin
        case expense(id: Int)
        
        var value: String {
            let baseURL = Environment.current.baseURLString
            
            switch self {
            case .doLogin:
                return "\(baseURL)/api/login"
            case .expense(let id):
                return "\(baseURL)/api/statements/\(id)"
            }
        }
    }
}
