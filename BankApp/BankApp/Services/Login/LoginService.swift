//
//  LoginService.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 15/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import Foundation

protocol LoginServiceProtol  {
    func doLogin(completion: @escaping (ServiceResult<[Contact]>) -> Void)
}
