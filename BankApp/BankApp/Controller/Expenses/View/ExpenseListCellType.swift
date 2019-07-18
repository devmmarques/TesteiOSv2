//
//  ExpenseListCellType.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 15/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

enum ExpenseListCellType<T> {
    case loading
    case cell(T)
    case error(WebserviceError)
}
