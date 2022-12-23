//
//  LoginOptionsViewController.swift
//  imokey
//
//  Created by Tugay on 21.12.2022.
//

import UIKit


class SignInOptionsViewController: UIViewController {
    var appleButton: CustomButton!
    var googleButton : CustomButton!
    var facebookButton: CustomButton!
    var mailButton: CustomButton!
    
    
    var viewModel: SignInOptionsViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    var stackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        placeStackView()
        activateConstraints()
    }
}

extension SignInOptionsViewController {
    func activateConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant:  -10),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80)
            
        ])
    }
}

extension SignInOptionsViewController: SignInOptionsViewModelDelegate {
    func selected(option: SelectionOptions?) {
        guard let option = option else { return }
        viewModel.signIn(with: option)
    }
}

extension SignInOptionsViewController {
    func placeAppleButton() {
        appleButton = CustomButton(title: "Sign in with Apple", image: UIImage(named: "apple.svg"))
        appleButton.tag = SelectionOptions.apple.rawValue
        appleButton.addTarget(self, action: #selector(selectionButtonTapped), for: .touchUpInside)
        stackView.addArrangedSubview(appleButton)
    }
    
    func placeGoogleButton() {
        googleButton = CustomButton(title: "Sign in with Google", image: UIImage(named: "google.svg"))
        googleButton.tag = SelectionOptions.google.rawValue
        googleButton.addTarget(self, action: #selector(selectionButtonTapped), for: .touchUpInside)
        stackView.addArrangedSubview(googleButton)
        
    }
    
    func placeFacebookButton() {
        facebookButton = CustomButton(title: "Sign in with Facebook", image: UIImage(named: "facebook.svg"))
        facebookButton.tag = SelectionOptions.facebook.rawValue
        facebookButton.addTarget(self, action: #selector(selectionButtonTapped), for: .touchUpInside)
        stackView.addArrangedSubview(facebookButton)
    }
    
    func placeMailButton() {
        mailButton = CustomButton(title: "Sign in with Email", image: UIImage(named: "mail.svg"))
        mailButton.tag = SelectionOptions.email.rawValue
        mailButton.addTarget(self, action: #selector(selectionButtonTapped), for: .touchUpInside)
        stackView.addArrangedSubview(mailButton)
    }
    
    func placeStackView() {
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 20
        
        placeAppleButton()
        placeGoogleButton()
        placeFacebookButton()
        placeMailButton()
    }
    
    @objc func selectionButtonTapped(sender: UIButton){
        selected(option: SelectionOptions(rawValue: sender.tag))
//        let optionsController = SignInWithEmailViewController()
//        //        if let sheet = optionsController.presentationController as? UISheetPresentationController {
//        //            sheet.detents = [.medium()]
//        //            sheet.largestUndimmedDetentIdentifier = .medium
//        //            sheet.prefersGrabberVisible = true
//        //
//        //        }
//
//        present(optionsController, animated: true)
//
//        //(UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(LoginWithEmailViewController())
    }
}



