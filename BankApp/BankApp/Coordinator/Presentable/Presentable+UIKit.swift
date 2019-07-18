//
//  Presentable+UIKit.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 16/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//
import class UIKit.UIViewController
import class UIKit.UIWindow

extension UIViewController: Presentable {
    func toPresent() -> ControllerProtocol {
        return self
    }
}

extension UIWindow: Presentable {
    func toPresent() -> ControllerProtocol {
        return rootViewController!
    }
}

