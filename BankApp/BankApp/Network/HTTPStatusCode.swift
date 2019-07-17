//
//  HTTPStatusCode.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 17/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import Foundation

enum HTTPStatusCode: Int {
    case unauthorized = 401
    case forbidden = 403
    case internalServerError = 500
}
