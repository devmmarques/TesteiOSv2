//
//  LoginViewControllerTests.swift
//  BankAppUITests
//
//  Created by Marco Henrique Maia Marques on 17/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import XCTest
@testable import BankApp

final class LoginViewControllerTests: KIFTestCase {

    private func createController(type: LoginWebserviceType) {
        let service = MockLoginWebservice(type: type)
        let presenter = LoginPresenter(loginService: service)
    }

}
