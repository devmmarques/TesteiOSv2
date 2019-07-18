//
//  ApplicationCoordinator.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 16/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import UIKit

final class ApplicationCoordinator: Coordinator {
    
    private let router: AnyRouter<UIWindow>
    
    required init<Router: RouterProtocol>(router: Router) where Router.Controller == UIWindow {
        self.router = AnyRouter(router)
        super.init()
    }
    
    override func start() {
        
        let loginCoordinator = LoginCoordinator()
        add(child: loginCoordinator)
        loginCoordinator.finishflow = { [weak self] login in
            self?.remove(child: loginCoordinator)
            
            let navigationController = UINavigationController()
            let expenseCoordinatorr = ExpenseCoordinator(router: AnyNavigationRouter(NavigationRouter(rootController: navigationController)), userAccount: login)
            self?.add(child: expenseCoordinatorr)
            expenseCoordinatorr.start()
            
            self?.router.setRoot(expenseCoordinatorr, animated: true)
        }
        loginCoordinator.start()
        router.setRoot(loginCoordinator, animated: true)
    }
}
