//
//  EmptyState.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 17/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import UIKit

enum EmptyState {
    case expense
    
    var title: String {
        switch self {
        case .expense:
            return L10n.emptyStateExpenseTitle
        }
    }
    
    var description: String {
        switch self {
        case .expense:
            return L10n.emptyStateExpenseDescription
        }
    }
    
    var imageName: UIImage {
        switch self {
        case .expense:
            return Asset.icCodebarEmptystate.image
        }
    }
}

