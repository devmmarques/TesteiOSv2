//
//  ErrorTableViewCell.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 17/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import UIKit

final class ErrorTableViewCell: UITableViewCell {
    
    func setupCell(error: WebserviceError, completion: @escaping () -> Void) {
        self.backgroundColor = .clear
        ManagerError().handler(error: error, on: self, completion: completion)
    }
}
