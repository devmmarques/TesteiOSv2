//
//  DefaultKeychainWrapper.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 17/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import Foundation
import KeychainSwift

public protocol KeychainWrapper {
    func save<T: Codable>(key: String, object: T)
    func load<T: Codable>(key: String) -> T?
    func logout(key: String)
}

public class DefaultKeychainWrapper: KeychainWrapper {
    let keychain: KeychainSwift
    
    public init(keychain: KeychainSwift = KeychainSwift()) {
        self.keychain = keychain
    }
    
    public func save<T>(key: String, object: T) where T: Codable {
        if let data = try? JSONEncoder().encode(object) {
            keychain.set(data, forKey: key)
        }
    }
    
    public func load<T>(key: String) -> T? where T: Codable {
        guard let data = self.keychain.getData(key) else {
            return nil
        }
        
        guard let object = try? JSONDecoder().decode(T.self, from: data) else {
            return nil
        }
        
        return object
    }
    
    public func logout(key: String) {
        keychain.delete(key)
    }
}
