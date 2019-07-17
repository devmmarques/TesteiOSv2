//
//  UserAccount.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 15/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import Foundation

struct UserAccount: Codable {
    let userId: Int
    let name: String
    let bankAccount: String
    let agency: String
    let balance: Double
}

