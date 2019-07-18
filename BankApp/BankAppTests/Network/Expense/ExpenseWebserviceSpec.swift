//
//  ExpenseWebserviceSpec.swift
//  BankAppTests
//
//  Created by Marco Henrique Maia Marques on 17/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import Nimble
import Quick
@testable import BankApp

final class ExpenseWebserviceSpec: QuickSpec {
    
    override func spec() {
        
        describe("Test Expense webservice") {
         
            context("") {
             
                var webService = ExpenseService()
                
                it("return  a valid expense if webservice return") {
                    webService = ExpenseService(service: MockWebservice(type: .expense))
                    webService.fetchExpenses(idExpense: 1, completion: { result in
                        switch result {
                        case .success:
                            expect(true) == true
                        case .failure:
                            XCTFail()
                        }
                    })
                }
                
                it("return empty error after webservice returns a success") {
                    webService = ExpenseService(service: MockWebservice(type: .unexpectedError))
                    webService.fetchExpenses(idExpense: 1, completion: { result in
                        switch result {
                        case .success:
                            XCTFail()
                        case let .failure(error):
                            expect(error) == .unexpected
                        }
                    })
                    
                }
            }
        }
    }
}
