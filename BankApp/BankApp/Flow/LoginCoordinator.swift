//
//  LoginCoordinator.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 17/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import UIKit

final class LoginCoordinator: Coordinator {
    private let router: Router<UIViewController>
    
    var finishflow: ((UserAccount) -> Void)?

    required override init() {
        
//        let storyboard = UIStoryboard(name: "LoginViewController", bundle: nil)
//        let viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let viewController = LoginViewController.instantiate()
        router = Router(rootController: viewController)
        super.init()
        viewController.didFinishLogin = { [weak self] login in
            self?.finishflow?(login)
        }
    }
    
    override func start() { }
}

extension LoginCoordinator: Presentable {
    func toPresent() -> ControllerProtocol {
        return router.rootController
    }
}
