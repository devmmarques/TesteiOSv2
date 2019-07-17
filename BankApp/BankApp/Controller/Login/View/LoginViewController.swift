//
//  LoginViewController.swift
//  BankApp
//
//  Created by Marco Henrique Maia Marques on 17/07/19.
//  Copyright © 2019 Marco Henrique Maia Marques. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    private lazy var presenter: LoginPresenter = {
        let presenter = LoginPresenter(viewProtocol: self, serviceAPI: LoginService())
        return presenter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configLayout()
    }
    
    
    private func configLayout() {
        btnLogin.layer.cornerRadius = 7.0
        btnLogin.applyCellShadow(color: ColorName.colorBackgroundHeader.color, radius: 5.0, opacity: 0.3)
    }
    
    
    @IBAction func doLogin(_ sender: UIButton) {
        guard let user = self.loginTextField.text else { return }
        guard let password = self.passwordTextField.text else { return }
        presenter.doLogin(user: user, password: password)
    }
}

extension LoginViewController: LoginProtocol {
    
    func success() {
      
    }
    
    func showLoading() {
      
    }
    
    func dismissLoading() {
      
    }
    
    func show(error: Error) {
      
    }
    
}
