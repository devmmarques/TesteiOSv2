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
        self.service.fetchExpenses(idExpense: 1) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(expense):
                self.allExpenses = expense.statementList.map {
                    return ExpenseListCellType.cell($0)
                }
            case let .failure(error):
                self.allExpenses = [ExpenseListCellType.error(error)]
            }
        }
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
