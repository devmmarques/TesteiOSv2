//
//  ParamsBuilder.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 17/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

struct ParamsBuilder {
    
    func buildMultipleAttributesDividedByPipe(attrs: [Int]) -> String {
        if attrs.isEmpty { return ""}
        var params = ""
        for attr in attrs {
            params += "\(attr)|"
        }
        params.removeLast()
        return params
    }
}
