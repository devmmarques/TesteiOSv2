//
//  LoginPresenter.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 17/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import Foundation

class LoginPresenter {
    
    private let viewProtocol: LoginProtocol
    private let service: LoginService
    
    
    init(viewProtocol: LoginProtocol, serviceAPI: LoginService) {
        self.viewProtocol = viewProtocol
        self.service = serviceAPI
    }
    
    func doLogin(user: String, password: String) {
        self.service.doLogin(user: user, password: password) { [weak self] result in
//            guard let self = self else { return }
            switch result {
            case let .success(response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
