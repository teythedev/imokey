//
//  EmailAndPasswordViewController.swift
//  imokey
//
//  Created by Tugay on 29.12.2022.
//

import UIKit

class EmailAndPasswordViewController: UIViewController {
    
    var stackView: UIStackView!
    var loadingView: UIActivityIndicatorView!
    
    
    var titleTextLabel: UILabel!
    var emailTextField: UITextField!
    var passwordTextField: UITextField!
    var actionButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .bgColor
        
        placeStackView()
        placeLoadingView()
        activateConstraints()
    }
    
    func showLoading() {
        loadingView.isHidden = false
        loadingView.startAnimating()
    }
    func hideLoading() {
        loadingView.isHidden = true
        loadingView.stopAnimating()
    }
    
    func goToHomePage() {
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(HomeBuilder.make())
    }
}

extension EmailAndPasswordViewController {
    func activateConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loadingView.heightAnchor.constraint(equalToConstant: 100),
            loadingView.widthAnchor.constraint(equalToConstant: 100),
            
        ])
    }
}

extension EmailAndPasswordViewController {
    func placeLoadingView() {
        loadingView = UIActivityIndicatorView()
        loadingView.color = UIColor.bgColor
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loadingView)
        loadingView.layer.cornerRadius = 10
        loadingView.isHidden = true
        loadingView.backgroundColor = UIColor.textColor
    }
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
        titleTextLabel.text = "Title"
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
        actionButton = UIButton()
        actionButton.tag = Actions.registerAction.rawValue
        actionButton.backgroundColor = UIColor(red: 211 / 255, green: 255 / 255, blue: 91 / 255, alpha: 1)
        actionButton.layer.cornerRadius = 30
        actionButton.configuration?.buttonSize = .large
        actionButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        actionButton.setTitle("Title", for: .normal)
        actionButton.setTitleColor(.black, for: .normal)
        actionButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        stackView.addArrangedSubview(actionButton)
    }
}

extension EmailAndPasswordViewController {
    @objc func actionButtonTapped(sender: UIButton) {
        view.endEditing(true)
    }
}

