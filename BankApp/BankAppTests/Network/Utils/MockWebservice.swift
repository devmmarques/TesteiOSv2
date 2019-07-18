//
//  MockWebservice.swift
//  BankAppTests
//
//  Created by Marco Henrique Maia Marques on 17/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

// swiftlint:disable all

import Foundation
@testable import BankApp

enum MockWebserviceType {
    case unexpectedError
    case customerLogin
    case loginError
    case expense
}

final class MockWebservice: Webservice {
    
    let type: MockWebserviceType
    
    init(type: MockWebserviceType) {
        self.type = type
    }
    
    func request<T: Codable>(urlString: String,
                             method: HTTPMethod = .get,
                             parameters: [String : Any] = [:],
                             headers: [String : String] = [:],
                             encoding: ParameterEncoding = .url,
                             completion: @escaping (Result<T, WebserviceError>) -> Void) {
        switch type {
        case .unexpectedError:
            completion(.failure(.unexpected))
        case .loginError:
            completion(.failure(.unauthorized))
        default:
            let jsonDecoder = JSONDecoder()
            let object = try! jsonDecoder.decode(T.self, from: data)
            completion(.success(object))
        }
    }
}

extension MockWebservice {
    var data: Data {
        let path: String
        switch type {
        case .unexpectedError:
            fatalError("Unexpected error should return any data")
        case .customerLogin:
            path = Bundle(for: MockWebservice.self).path(forResource: "loginResponse", ofType: "json")!
        case .loginError:
            fatalError("Unexpected error should return any data")
        case .expense:
            path = Bundle(for: MockWebservice.self).path(forResource: "customerExpenses", ofType: "json")!
        }
        let fileURL = URL(fileURLWithPath: path)
        return try! Data(contentsOf: fileURL)
    }
}
