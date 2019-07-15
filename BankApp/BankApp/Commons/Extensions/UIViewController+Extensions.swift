//
//  UIViewController+Extensions.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 15/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import UIKit


public enum NavigationBarStyle {
    case `default`
    case clear
    case colored(barColor: UIColor)
}

extension UIViewController {
    
    public func setupNavigationBar(with style: NavigationBarStyle,
                                   prefersLargeTitles: Bool = true) {
        
        guard let navigationController = navigationController else {
            return
        }
        
        switch style {
        case .default:
            navigationController.navigationBar.barTintColor = ColorName.colorBackgroundHeader.color
        case .colored(let barColor):
            navigationController.navigationBar.barTintColor = barColor
        case .clear:
            navigationController.isNavigationBarHidden = true
        }
        
        navigationController.navigationItem.largeTitleDisplayMode = .never
        navigationController.navigationItem.hidesSearchBarWhenScrolling = false
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.barStyle = .black
        navigationController.navigationBar.tintColor = .white
        
        navigationController.navigationBar.prefersLargeTitles = prefersLargeTitles
        
        navigationController.navigationBar.layoutIfNeeded()
        navigationItem.backBarButtonItem?.title = ""
    }
}

