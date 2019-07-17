//
//  LoginPresenter.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 17/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import Foundation

class LoginPresenter {
    
    var loginService: LoginServiceProtol
    var viewProtocol: LoginViewProtocol?
    
    init(loginService: LoginServiceProtol = LoginService()) {
        self.loginService = loginService
    }
    
    func doLogin(user: String, password: String) {
        let login = Login(email: user, password: password)
        self.loginService.doLogin(login: login) { [weak self] result in
            switch result {
            case let .success(login):
                print(login)
            case let.failure(error):
                print(error)
            }
        }
    }
    
}
