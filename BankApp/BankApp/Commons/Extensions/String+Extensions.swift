//
//  String+Extensions.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 16/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import Foundation
import SwiftDate

extension String {
    
    func toDateFormatted(with format: String) -> String {
        let date = toDate("dd.MM.yyyy", region: .brazil)
        return date?.toFormat(format) ?? ""
    }
}
