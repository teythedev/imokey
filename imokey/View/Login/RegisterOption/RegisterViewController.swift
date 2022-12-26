//
//  RegisterViewController.swift
//  imokey
//
//  Created by Tugay on 24.12.2022.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var stackView: UIStackView!
    
    var titleTextLabel: UILabel!
    var emailTextField: UITextField!
    var passwordTextField: UITextField!
    var registerButton: UIButton!
    
    var viewModel: RegisterViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .bgColor
        placeStackView()
        activateConstraints()
    }
}
extension RegisterViewController: RegisterViewModelDelegate {
    func handleViewModelOutput(_ output: RegisterViewModelOutput) {
        switch output {
        case .nilEmailOrPassword(let string):
            let ac = UIAlertController(title: nil, message: string, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .cancel))
            self.present(ac, animated: true)
        }
    }
    
    func navigateToAfterRegister() {
        print("Change root view controller after registered successfully")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(HomePageBuilder.make())
        
    }
    
    
}

extension RegisterViewController {
    func activateConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
        ])
    }
}

extension RegisterViewController {
    
    func placeStackView() {
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 20
        
        placeTitleTextLabel()
        placeEmailTextField()
        placePasswordTextField()
        placeRegisterButton()
        
    }
    
    func placeTitleTextLabel() {
        titleTextLabel = UILabel()
        titleTextLabel.text = "Enter your email and set a password"
        titleTextLabel.font = UIFont.systemFont(ofSize: 24)
        titleTextLabel.numberOfLines = 0
        titleTextLabel.textAlignment = .center
        stackView.addArrangedSubview(titleTextLabel)
    }
    
    func placeEmailTextField() {
        emailTextField = UITextField()
        emailTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: emailTextField.frame.height))
        emailTextField.leftViewMode = .always
        emailTextField.placeholder = "Email"
        emailTextField.layer.cornerRadius = 30
        emailTextField.layer.borderColor = UIColor.gray.cgColor
        emailTextField.layer.borderWidth = 1
        emailTextField.keyboardType = .emailAddress
        emailTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        stackView.addArrangedSubview(emailTextField)
    }
    
    func placePasswordTextField() {
        passwordTextField = UITextField()
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordTextField.frame.height))
        passwordTextField.leftViewMode = .always
        passwordTextField.placeholder = "Password"
        passwordTextField.layer.cornerRadius = 30
        passwordTextField.layer.borderColor = UIColor.gray.cgColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.isSecureTextEntry = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        stackView.addArrangedSubview(passwordTextField)
    }
    
    func placeRegisterButton(){
        registerButton = UIButton()
        registerButton.tag = Actions.registerAction.rawValue
        registerButton.backgroundColor = UIColor(red: 211 / 255, green: 255 / 255, blue: 91 / 255, alpha: 1)
        registerButton.layer.cornerRadius = 30
        registerButton.configuration?.buttonSize = .large
        registerButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        stackView.addArrangedSubview(registerButton)
    }
}

extension RegisterViewController {
    @objc func registerButtonTapped(sender: UIButton) {
        viewModel.register(with: emailTextField.text, and: passwordTextField.text)
    }
}
