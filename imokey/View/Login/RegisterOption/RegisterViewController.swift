//
//  RegisterViewController.swift
//  imokey
//
//  Created by Tugay on 24.12.2022.
//

import UIKit

final class RegisterViewController: EmailAndPasswordViewController {
    var viewModel: RegisterViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func loadView() {
        super.loadView()
        actionButton.setTitle("Register", for: .normal)
        titleTextLabel.text = "Enter your email and set a password"
    }
    
    override func actionButtonTapped(sender: UIButton) {
        super.actionButtonTapped(sender: sender)
        viewModel.register(with: emailTextField.text, and: passwordTextField.text)
    }
}

extension RegisterViewController: RegisterViewModelDelegate {
    func handleViewModelOutput(_ output: RegisterViewModelOutput) {
        switch output {
        case .showErrorAlert(let string):
            let ac = UIAlertController(title: nil, message: string, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(ac, animated: true)
        case .showLoading(let show):
            if show {
                showLoading()
            }else {
                hideLoading()
            }
        }
    }
    
    func navigateToAfterRegister() {
        goToHomePage()
    }
}



