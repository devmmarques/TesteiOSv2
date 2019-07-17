//
//  LoginRouter.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 17/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import Foundation

enum LoginRouter {
    case doLogin(user: String, password: String)
}

extension LoginRouter: ServiceRouter {
    
    var path: String {
        switch self {
        case .doLogin(user: _, password: _):
            return "/api/login"
        }
    }
    
    var parameters: [String : Any] {
        switch self {
        case .doLogin(let user, let password):
            return ["user": user, "password": password]
        }
    }
    
    var method: NamespaceHTTPMethod {
        switch self {
        case .doLogin(user: _, password: _):
            return .post
        }
    }
}
