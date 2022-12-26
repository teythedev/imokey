//
//  LoginOptionsViewModel.swift
//  imokey
//
//  Created by Tugay on 24.12.2022.
//

import Foundation

final class SignInOptionsViewModel: SignInOptionsViewModelProtocol {
    
    weak var delegate: SignInOptionsViewModelDelegate?
    
    func signIn(with option: SelectionOptions) {
            switch option {
            case .apple:
                print("apple")
            case .google:
                print("google")
            case .facebook:
                print("facebook")
            case .email:
                print("email")
                delegate?.navigateToEmailSignIn()
            }
    }
}
