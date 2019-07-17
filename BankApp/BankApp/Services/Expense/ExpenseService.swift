//
//  ReportService.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 15/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import Foundation

protocol ExpenseServiceProtol  {
    typealias ExpenseResult = Result<StatementList, WebserviceError>
    func fetchExpenses(idExpense: Int, completion: @escaping (ExpenseResult) -> Void)
}

final  class ExpenseService: NSObject, ExpenseServiceProtol {
    
    let service: Webservice
    
    init(service: Webservice = BaseWebservice()) {
        self.service = service
    }
    
    func fetchExpenses(idExpense: Int, completion: @escaping (ExpenseResult) -> Void) {
        let parameters: [String: Any] = ["": idExpense]
        service.request(urlString: API.Path.expense.value, parameters: parameters) { (result: ExpenseResult) in
            switch result {
            case let .success(statement):
                if statement.statementList.isEmpty {
                   completion(.failure(.empty(.expense)))
                } else {
                    completion(.success(statement))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

}
