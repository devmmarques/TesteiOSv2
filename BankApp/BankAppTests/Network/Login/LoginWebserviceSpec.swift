//
//  LoginWebserviceSpec.swift
//  BankAppTests
//
//  Created by Marco Henrique Maia Marques on 17/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import Nimble
import Quick
@testable import BankApp

final class LoginWebserviceSpec: QuickSpec {
    
    override func spec() {
        
        describe("Test login webservice") {
            
            context("request Login function") {
                
                var webservice: LoginService!
                let loginValid = Login(email: "test_user@gmail", password: "Test@1")
                let loginInvalid = Login(email: "test_user", password: "teste1")
                
                it("return a valid login if webservice return a autentication success") {
                    webservice = LoginService(service: MockWebservice(type: .customerLogin))
                    webservice.doLogin(login: loginValid, completion: { result in
                        switch result {
                        case .success:
                            expect(true) == true
                        case .failure:
                            XCTFail()
                        }
                    })
                }
                
                it("return a invalid login if webservice return a ") {
                    webservice = LoginService(service: MockWebservice(type: .loginError))
                    webservice.doLogin(login: loginInvalid, completion: { result in
                        switch result {
                        case .success:
                            XCTFail()
                        case let .failure(error):
                            expect(error) == .unauthorized
                        }
                    })
                }
                
                it("return unexpected error after webservice returns unexpected error") {
                    webservice = LoginService(service: MockWebservice(type: .unexpectedError))
                    webservice.doLogin(login: loginValid, completion: { result in
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



