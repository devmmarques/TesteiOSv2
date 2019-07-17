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
    @IBOutlet weak var loadingActivity: UIActivityIndicatorView!
    
    var didFinishLogin: ((UserAccount) -> Void)?
    
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
            self.loginTextField.text = "test_user@gmail.com"
            self.passwordTextField.text = "Test@1"
        #endif
        loadingActivity.isHidden = true
        loadingActivity.tintColor = ColorName.colorBackgroundHeader.color
        btnLogin.layer.cornerRadius = 7.0
        btnLogin.applyCellShadow(color: ColorName.colorBackgroundHeader.color, radius: 5.0, opacity: 0.3)
    }
    
    
    @IBAction func doLogin(_ sender: UIButton) {
        guard let user = loginTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        if presenter.validatePassword(password: password) && presenter.validateUser(user: user) {
          presenter.doLogin(user: user, password: password)
        }
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: L10n.error, message: message, preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(actionOK)
        present(alert, animated: true, completion: nil)
    }
}

extension LoginViewController: LoginViewProtocol {
    
    func showLoading() {
        loadingActivity.isHidden = false
        loadingActivity.startAnimating()
        
        loginTextField.alpha = 0.5
        loginTextField.isUserInteractionEnabled = false
        passwordTextField.alpha = 0.5
        passwordTextField.isUserInteractionEnabled = false
        
        btnLogin.alpha = 0.5
        btnLogin.isUserInteractionEnabled = false
    }
    
    func dismissLoading() {
        loadingActivity.isHidden = true
        loadingActivity.stopAnimating()
        
        loginTextField.alpha = 1.0
        loginTextField.isUserInteractionEnabled = true
        passwordTextField.alpha = 1.0
        passwordTextField.isUserInteractionEnabled = true
        
        btnLogin.alpha = 1.0
        btnLogin.isUserInteractionEnabled = true
    }
    
    func show(error: String) {
        showAlert(message: error)
    }
    
    func show(error: Error) {
        showAlert(message: error.localizedDescription)
    }
    
}
