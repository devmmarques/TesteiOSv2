//
//  Receipt.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 15/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import Foundation

struct Receipt: Codable {
    let title: String
    let desc: String
    let date: String
    let value: Double
}
