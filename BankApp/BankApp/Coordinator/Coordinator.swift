//
//  Coordinator.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 16/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

protocol CoordinatorProtocol: class {
    var childCoordinators: [CoordinatorProtocol] { get }
    
    func start()
}

class Coordinator {
    final private (set) var childCoordinators: [CoordinatorProtocol] = []
    
    func start() {
        guard type(of: self) != Coordinator.self else {
            _abstract()
        }
    }
}

extension Coordinator: CoordinatorProtocol {
    final func add(child coordinator: CoordinatorProtocol) {
        guard childCoordinators.first(where: { $0 === coordinator }) == nil else { return }
        childCoordinators.append(coordinator)
    }
    
    final func remove(child coordinator: CoordinatorProtocol) {
        childCoordinators.removeAll(where: { $0 === coordinator })
    }
    
    final func removeAllChildCoordinators() {
        childCoordinators.removeAll(keepingCapacity: false)
    }
}

// MARK: Abstract warning
private func _abstract(file: StaticString = #file, line: UInt = #line) -> Never {
    fatalError("Method must be overridden", file: file, line: line)
}
