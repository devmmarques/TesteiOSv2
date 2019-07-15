//
//  ReportRouter.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 15/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import Foundation

enum ReportRouter {
    case fetchReport(id: Int)
}

extension ReportRouter: ServiceRouter {
    
    var path: String {
        switch self {
        case .fetchReport(let id):
            return "/statements/\(id)"
        }
    }
    
    var method: NamespaceHTTPMethod {
        return .get
    }
}
