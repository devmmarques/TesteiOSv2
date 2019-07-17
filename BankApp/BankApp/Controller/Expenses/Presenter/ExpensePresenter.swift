//
//  ExpensePresenter.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 15/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import Foundation

final class ExpensePresenter {
    
    weak var viewProtocol: ExpenseProtocol?
    private var service: ExpenseServiceProtol
    
    private var allExpenses: [ExpenseListCellType<Expense>] = [] {
        didSet {
            self.viewProtocol?.show()
        }
    }
    
    init(service: ExpenseServiceProtol = ExpenseService()) {
        self.service = service
    }
    
    func fetchExpenses(idExpense: Int) {
        allExpenses = [.loading]
        self.service.fetchExpenses(idExpense: idExpense) { [weak self] result in
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
