//
//  ControllerProtocol.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 16/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

enum ControllerPresentStyle {
    case present(animated: Bool)
    case push(animated: Bool)
    case setRoot(animated: Bool)
}

protocol ControllerProtocol: AnyObject {
    func present<Controller: ControllerProtocol>(_ controller: Controller, style: ControllerPresentStyle)
    func dismiss(animated: Bool)
}
