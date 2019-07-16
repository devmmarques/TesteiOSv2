//
//  ExpenseCoordinator.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 16/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import UIKit

final class ExpenseCoordinator: Coordinator {
    private let router: AnyNavigationRouter<UINavigationController>
    var finishflow: (() -> Void)?
    
    required init<Router: NavigationRouterProtocol>(router: Router) where Router.Controller == UINavigationController {
        self.router = AnyNavigationRouter(router)
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func start() {
        let controller = ListExpensesViewController()
        router.setRoot(controller, animated: true)
    }
}

extension ExpenseCoordinator: Presentable {
    func toPresent() -> ControllerProtocol {
        return router.rootController
    }
}
