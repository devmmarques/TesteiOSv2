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
//        allExpenses = [.loading]
        self.service.fetchExpense(id: 1){ [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(response):
                self.allExpenses = response.statementList.map {
                    return ExpenseListCellType.cell($0)
                }
            case .failure(let error):
                print(error)
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
