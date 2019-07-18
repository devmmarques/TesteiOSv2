//
//  Environment.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 17/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import Foundation

struct Environment {
    let configuration: Configuration
    
    init(configuration: Configuration) {
        self.configuration = configuration
    }
    
    static var current: Environment {
        return Environment(configuration: .current())
    }
}

extension Environment {
    var baseURLString: String {
        switch configuration {
        case .development:
            return "https://bank-app-test.herokuapp.com"
        default:
            return "https://bank-app-test.herokuapp.com"
        }
    }
}
