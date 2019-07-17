//
//  LoginProtocol.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 17/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

protocol LoginViewProtocol: AnyObject {
    func success()
    func showLoading()
    func dismissLoading()
    func show(error: Error)
}
