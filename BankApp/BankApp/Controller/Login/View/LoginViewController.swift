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
        let presenter = LoginPresenter(loginService: LoginService())
        presenter.viewProtocol = self
        return presenter
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configLayout()
    }
    
    
    private func configLayout() {
        
        #if DEBUG
            self.loginTextField.text = "test_user"
            self.passwordTextField.text = "Test@1"
        #endif
        btnLogin.layer.cornerRadius = 7.0
        btnLogin.applyCellShadow(color: ColorName.colorBackgroundHeader.color, radius: 5.0, opacity: 0.3)
    }
    
    
    @IBAction func doLogin(_ sender: UIButton) {
        guard let user = loginTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        presenter.doLogin(user: user, password: password)
        
    }
}

extension LoginViewController: LoginViewProtocol {
    
    func success() {
      
    }
    
    func showLoading() {
      
    }
    
    func dismissLoading() {
      
    }
    
    func show(error: Error) {
      
    }
    
}
