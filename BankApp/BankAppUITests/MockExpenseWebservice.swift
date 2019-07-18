//
//  MockExpenseWebservice.swift
//  BankAppUITests
//
//  Created by Marco Henrique Maia Marques on 17/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import Foundation
@testable import BankApp

enum ExpenseWebserviceType {
    case success
    case failure
    case notConnectedToInternet
}

struct MockExpenseWebservice {
    
    let type: ExpenseWebserviceType
    
    init(type: ExpenseWebserviceType) {
        self.type = type
    }
    
}
