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
        
    }
    
}
