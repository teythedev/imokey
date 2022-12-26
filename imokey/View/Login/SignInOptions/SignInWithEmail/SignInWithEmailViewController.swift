//
//  LoginWithEmailViewController.swift
//  imokey
//
//  Created by Tugay on 23.12.2022.
//

import UIKit

class SignInWithEmailViewController: UIViewController {
   
    var viewModel: SignInWithEmailViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        // Do any additional setup after loading the view.
    }

}

extension SignInWithEmailViewController : SignInWithEmailViewModelDelegate {
    func navigateAfterSignIn() {
        print("Succesfully logged in")
    }
    
    
}
