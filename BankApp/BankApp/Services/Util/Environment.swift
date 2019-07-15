//
//  Environment.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 15/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import Foundation

struct Environment {
    
    private static var environments: [String: Any]? {
        guard let dict: [String: Any] = Bundle.main.infoDictionary?["EnvironmentConfig"] as? [String: Any] else { return nil }
        return dict
    }
    
    static var host: String {
        guard let value = environments?["HOST"] as? String else { return "" }
        return value
    }
}
