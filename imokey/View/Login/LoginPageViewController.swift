//
//  LoginPageViewController.swift
//  imokey
//
//  Created by Tugay on 19.12.2022.
//

import UIKit

class LoginPageViewController: UIViewController {
    
    var registerButton: UIButton!
    var signInButton: UIButton!
    var policyText: UILabel!

    var viewModel: LoginPageViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        placeRegisterButton()
        placeSignInButton()
        placePolicyText()
        
        activateConstraints()
    }
}

extension LoginPageViewController: LoginPageViewModelDelagete {
    func showBottomSheet(with action: Actions) {
        switch action {
        case .signInAction:
            let signInOptionsController = SignInOptionsBuilder.make()
            if let sheet = signInOptionsController.presentationController as? UISheetPresentationController {
                sheet.detents = [.medium()]
                sheet.largestUndimmedDetentIdentifier = .medium
                sheet.prefersGrabberVisible = true
                
            }
            present(signInOptionsController, animated: true)
        case .registerAction:
            let signInOptionsController = RegisterViewController()
            if let sheet = signInOptionsController.presentationController as? UISheetPresentationController {
                sheet.detents = [.medium()]
                sheet.largestUndimmedDetentIdentifier = .medium
                sheet.prefersGrabberVisible = true
                
            }
            present(signInOptionsController, animated: true)
        }
    }
}


//MARK: - Activate Constraints
extension LoginPageViewController {
    func activateConstraints() {
        NSLayoutConstraint.activate([
            policyText.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            policyText.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            policyText.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            signInButton.bottomAnchor.constraint(equalTo: policyText.topAnchor, constant: -30),
            signInButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            signInButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            signInButton.heightAnchor.constraint(equalToConstant: 60),
            registerButton.bottomAnchor.constraint(equalTo: signInButton.topAnchor, constant: -20),
            registerButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            registerButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            registerButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
}

 //MARK: - Place Item
extension LoginPageViewController {
    
    @objc func buttonTapped(sender: UIButton) {
        let action = Actions(rawValue: sender.tag)
        viewModel.selectedAction(is: action)
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
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(registerButton)
    }
    
    func placeSignInButton() {
        signInButton = UIButton()
        signInButton.tag = Actions.signInAction.rawValue
        signInButton.layer.cornerRadius = 30
        signInButton.configuration?.buttonSize = .large
        signInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.setTitleColor(.black, for: .normal)
        signInButton.layer.borderWidth  = 2
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(signInButton)
    }
    
    func placePolicyText() {
        policyText = UILabel()
        policyText.numberOfLines = 0
        policyText.textAlignment = .center
        policyText.text = "By signing up you accept the Terms of Service and Privacy Policy"
        policyText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(policyText)
    }
}
