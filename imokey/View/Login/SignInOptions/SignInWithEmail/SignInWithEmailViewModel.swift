//
//  SignInWithEmailViewModel.swift
//  imokey
//
//  Created by Tugay on 26.12.2022.
//

import Foundation

final class SignInWithEmailViewModel: SignInWithEmailViewModelProtocol {
    
    weak var delegate: SignInWithEmailViewModelDelegate?
    
    func signIn(with email: String, and password: String) {
        delegate?.navigateAfterSignIn()
    }
}
