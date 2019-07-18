//
//  LoginError.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 17/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import Foundation

struct LoginError: Codable {
    let code: Int?
    let message: String?
}
