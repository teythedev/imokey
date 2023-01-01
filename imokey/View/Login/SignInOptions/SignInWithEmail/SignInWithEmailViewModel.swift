//
//  SignInWithEmailViewModel.swift
//  imokey
//
//  Created by Tugay on 26.12.2022.
//

import Foundation

final class SignInWithEmailViewModel: SignInWithEmailViewModelProtocol {
    
    weak var delegate: SignInWithEmailViewModelDelegate?
    private let signInService: SignInWithEmailProtocol
    
    init(signInService: SignInWithEmailProtocol) {
        self.signInService = signInService
    }
    
    func signIn(with email: String?, and password: String?) {
        delegate?.handleViewModelOuput(.showLoading(true))
        guard let email = email, let password = password else {
            delegate?.handleViewModelOuput(.showLoading(false))
            delegate?.handleViewModelOuput(.showError("Password or email can not be empty"))
            return
        }
        signInService.signIn(withEmail: email, password: password) { [weak self] ( result: Result<User,SignInError> ) in
            self?.delegate?.handleViewModelOuput(.showLoading(false))
            switch result {
            case .success(_):
                self?.delegate?.navigateAfterSignIn()
            case .failure(let failure):
                self?.delegate?.handleViewModelOuput(.showError(failure.description))
            }
        }
    }
}
