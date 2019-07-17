//
//  LoginService.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 17/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import Foundation

protocol LoginServiceProtol  {
    typealias LoginResult = Result<UserResponse, WebserviceError>
    func doLogin(login: Login, completion: @escaping (LoginResult) -> Void)
}

final  class LoginService: NSObject, LoginServiceProtol {
    
    let service: Webservice
    
    init(service: Webservice = BaseWebservice()) {
        self.service = service
    }

    func doLogin(login: Login, completion: @escaping (LoginResult) -> Void) {
        let parameters: [String: Any] = ["user": login.email,
                                         "password": login.password]
        service.request(urlString: API.Path.doLogin.value, method: .post, parameters: parameters, encoding: .json) { (result: LoginResult) in
            switch result {
            case let .success(login):
                completion(.success(login))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
