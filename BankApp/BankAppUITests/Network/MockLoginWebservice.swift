//
//  MockLoginWebservice.swift
//  BankAppUITests
//
//  Created by Marco Henrique Maia Marques on 17/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import Foundation
@testable import BankApp

enum LoginWebserviceType {
    case success
    case failure
    case notConnectedToInternet
}

struct MockLoginWebservice: LoginServiceProtol {
    
    let type: LoginWebserviceType
    
    init(type: LoginWebserviceType) {
        self.type = type
    }
    
    func doLogin(login: Login, completion: @escaping (LoginResult) -> Void) {
        switch self.type {
        case .success:
            let data = MockWebservice(type: .customerLogin).data
            let jsonDecoder = JSONDecoder()
            let object = try! jsonDecoder.decode(LoginResponse.self, from: data)
            DispatchQueue(label: "MockWebservice").asyncAfter(deadline: .now() + 1) {
                DispatchQueue.main.async {
                    completion(.success(object))
                }
            }
        case .failure:
            completion(.failure(.unexpected))
        case .notConnectedToInternet:
            completion(.failure(.notConnectedToInternet))
        }
    }
}

