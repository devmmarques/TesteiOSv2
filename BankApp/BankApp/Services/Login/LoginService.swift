//
//  LoginService.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 17/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import Foundation

protocol LoginServiceProtol  {
    func doLogin(user: String, password: String, completion: @escaping (ServiceResult<UserResponse>) -> Void)
}

final  class LoginService: NSObject, LoginServiceProtol {
    
    private let serviceProtocol: ServiceClientProtocol
    
    override init() {
        self.serviceProtocol = ServiceClient()
    }
    
    init(service: ServiceClientProtocol) {
        self.serviceProtocol = service
    }
    
    func doLogin(user: String, password: String, completion: @escaping (ServiceResult<UserResponse>) -> Void) {
        let router = LoginRouter.doLogin(user: user, password: password)
        self.serviceProtocol.request(router: router) { (response: ServiceResult<UserResponse>) in
            switch response {
            case let .success(value):
                completion(.success(value))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
