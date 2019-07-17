//
//  Router.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 16/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import class UIKit.UIViewController

final class Router<Controller: ControllerProtocol>: RouterProtocol {
    private (set) var rootController: Controller
    
    init(rootController: Controller) {
        self.rootController = rootController
    }
    
    func setRoot(_ module: Module, animated: Bool) {
        guard let controller = module.toPresent() as? UIViewController else { return }
        rootController.present(controller, style: .setRoot(animated: animated))
    }
    
    func present(_ module: Module, animated: Bool) {
        guard let controller = module.toPresent() as? UIViewController else { return }
        rootController.present(controller, style: .present(animated: animated))
    }
    
    func dismiss(_ module: Module, animated: Bool) {
        rootController.dismiss(animated: animated)
    }
}
