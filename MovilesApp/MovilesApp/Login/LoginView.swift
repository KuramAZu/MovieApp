//
//  LoginView.swift
//  MovilesApp
//
//  Created by Domingo on 27/Feb/2023.
//

import Foundation
import UIKit
import UIKit

class LoginViewController: UIViewController {
    
    var viewModel: LoginClass = LoginClass()
    var mostrar = false
    var color: UIColor = .brown
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton()
    let titleText = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .brown
        
        titleText.text = "Movies App"
        titleText.textColor = .black
        titleText.font = .boldSystemFont(ofSize: 20)
        view.addSubview(titleText)

        usernameTextField.placeholder = "Nombre de usuario"
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.backgroundColor = .gray
        usernameTextField.autocapitalizationType = .none
        usernameTextField.autocorrectionType = .no
        view.addSubview(usernameTextField)

        passwordTextField.placeholder = "Contraseña"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.backgroundColor = .gray
        passwordTextField.autocapitalizationType = .none
        passwordTextField.autocorrectionType = .no
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)

        loginButton.setTitle("Iniciar sesión", for: .normal)
        loginButton.setTitleColor(.blue, for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        view.addSubview(loginButton)
        
        viewModel.isActiveDidChange = { [weak self] sucess in
                    guard let self = self else { return }
                    if sucess {
                        // Realizar acción se ihizo login correctamente
                        DispatchQueue.main.async {
                            self.color = .brown
                            let nextVC = ListMoviesView(presenter: ListMoviesPresenter(router: ListMoviesRouter()))
                            self.present(nextVC, animated: false, completion: nil)
                        }
                    }
                }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let titleWidth: CGFloat = 200
        let titleHeight: CGFloat = 30
        let textFieldWidth: CGFloat = 200
        let textFieldHeight: CGFloat = 30
        let buttonWidth: CGFloat = 120
        let buttonHeight: CGFloat = 30

        titleText.frame = CGRect(x: view.bounds.midX - (titleWidth / 4),
                                          y: view.bounds.midY - (titleHeight * 4),
                                          width: titleWidth,
                                          height: titleHeight)
        
        usernameTextField.frame = CGRect(x: view.bounds.midX - (textFieldWidth / 2),
                                          y: view.bounds.midY - (textFieldHeight * 2),
                                          width: textFieldWidth,
                                          height: textFieldHeight)

        passwordTextField.frame = CGRect(x: view.bounds.midX - (textFieldWidth / 2),
                                          y: view.bounds.midY - (textFieldHeight / 2),
                                          width: textFieldWidth,
                                          height: textFieldHeight)

        loginButton.frame = CGRect(x: view.bounds.midX - (buttonWidth / 2),
                                      y: view.bounds.midY + (textFieldHeight / 2),
                                      width: buttonWidth,
                                      height: buttonHeight)
       
    }

    @objc func loginButtonTapped() {
        // Código para manejar el inicio de sesión
        viewModel.hacerLogin(user: usernameTextField.text ?? "",
                           pass: passwordTextField.text ?? "")
          }
}
