//
//  LoginWithEmailViewController.swift
//  imokey
//
//  Created by Tugay on 23.12.2022.
//

import UIKit

final class SignInWithEmailViewController: EmailAndPasswordViewController {
   
    var viewModel: SignInWithEmailViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    override func loadView() {
        super.loadView()
        titleTextLabel.text = "Enter your email and password"
        actionButton.setTitle("Sing in", for: .normal)
        actionButton.backgroundColor = UIColor.bgColor
        actionButton.layer.borderColor = UIColor.textColor?.cgColor
        actionButton.layer.borderWidth = 2
        actionButton.setTitleColor(UIColor.textColor, for: .normal)
    }
}

extension SignInWithEmailViewController : SignInWithEmailViewModelDelegate {
    func handleViewModelOuput(_ output: SignInViewModelOutput) {
        switch output {
        case .showError(let string):
            let ac = UIAlertController(title: nil, message: string, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(ac, animated: true)
        case .showLoading(let bool):
            bool ? showLoading() : hideLoading()
        }
    }
    
    func navigateAfterSignIn() {
        goToHomePage()
    }
    
    
    override func actionButtonTapped(sender: UIButton) {
        super.actionButtonTapped(sender: sender)
        viewModel.signIn(with: emailTextField.text, and: passwordTextField.text)
    }
    
}
