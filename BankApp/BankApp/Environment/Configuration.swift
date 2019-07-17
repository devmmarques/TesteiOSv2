//
//  Configuration.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 17/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import Foundation

protocol ProjectInfo {
    var infos: [String: Any]? { get }
}

extension Bundle: ProjectInfo {
    var infos: [String: Any]? {
        return infoDictionary
    }
}

enum Configuration: String {
    case development = "Debug"
    case appStore = "Release"
    
    static func current(_ projectInfo: ProjectInfo = Bundle.main) -> Configuration {
        let configurationNameKey = "Configuration"
        let infos = projectInfo.infos
        
        guard let configurationName = infos?[configurationNameKey] as? String,
            let configuration = Configuration(rawValue: configurationName) else {
                
                return .development
        }
        
        return configuration
    }
}
