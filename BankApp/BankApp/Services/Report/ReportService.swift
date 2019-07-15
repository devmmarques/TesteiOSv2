//
//  ReportService.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 15/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import Foundation

protocol ReportServiceProtol  {
    func fetchReport(id: Int, completion: @escaping (ServiceResult<StatementList>) -> Void)
}

final  class ReportService: NSObject, ReportServiceProtol {
    
    private let serviceProtocol: ServiceClientProtocol
    
    override init() {
        self.serviceProtocol = ServiceClient()
    }
    
    init(service: ServiceClientProtocol) {
        self.serviceProtocol = service
    }
    
    func fetchReport(id: Int, completion: @escaping (ServiceResult<StatementList>) -> Void) {
        let router = ReportRouter.fetchReport(id: id)
        self.serviceProtocol.request(router: router) { (response: ServiceResult<StatementList>) in
            switch response {
            case let .success(value):
                completion(.success(value))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

}
