//
//  Region+Extensions.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 16/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import Foundation
import SwiftDate

extension Region {
    static let brazil = Region(calendar: Calendars.gregorian,
                               zone: Zones.americaSaoPaulo,
                               locale: Locales.portugueseBrazil)
}

