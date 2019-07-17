//
//  ExpensePresenter.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 15/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import Foundation

final class ExpensePresenter {
    
    private let viewProtocol: ExpenseProtocol
    private let service: ExpenseService
    
    private var allExpenses: [ExpenseListCellType<Expense>] = [] {
        didSet {
            self.viewProtocol.show()
        }
    }
    
    init(viewProtocol: ExpenseProtocol, serviceAPI: ExpenseService) {
        self.viewProtocol = viewProtocol
        self.service = serviceAPI
    }
    
    func fetchExpenses() {
     
    }
}

extension ExpensePresenter {
    
    func getCountExpense() -> Int {
        return allExpenses.count
    }
    
    func getExpense(by index: Int) -> ExpenseListCellType<Expense> {
        return allExpenses[index]
    }
}
