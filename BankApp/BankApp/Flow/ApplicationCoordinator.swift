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
        let navigationController = UINavigationController()
        let coordinator = ExpenseCoordinator(router: AnyNavigationRouter(NavigationRouter(rootController: navigationController)))
        add(child: coordinator)
        
        coordinator.start()
        router.setRoot(coordinator, animated: true)
    }
}
