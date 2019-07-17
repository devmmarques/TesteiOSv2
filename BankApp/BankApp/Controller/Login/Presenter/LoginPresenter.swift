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
        viewProtocol?.showLoading()
        let login = Login(email: user, password: password)
        self.loginService.doLogin(login: login) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(login):
                let keychain = DefaultKeychainWrapper()
                keychain.save(key: "userLogin", object: login)
                self.viewProtocol?.dismissLoading()
                self.viewProtocol?.didFinishLogin?(login.userAccount)
                
            case let.failure(error):
                self.viewProtocol?.dismissLoading()
                self.viewProtocol?.show(error: error)
            }
        }
    }
    
    func validatePassword(password: String) -> Bool {
        if password.isValidPassword() {
            return true
        }
        viewProtocol?.show(error: L10n.errorUserPasswordInvalid)
        return false
    }
    
    func validateUser(user: String) -> Bool {
        if user.isValidCPF() || user.isValidEmail() {
            return true
        }
        viewProtocol?.show(error: L10n.errorUserPasswordInvalid)
        return false
    }
    
}
