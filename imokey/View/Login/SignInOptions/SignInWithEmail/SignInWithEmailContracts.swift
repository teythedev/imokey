//
//  SignInWithEmailContracts.swift
//  imokey
//
//  Created by Tugay on 26.12.2022.
//

import Foundation

protocol SignInWithEmailViewModelProtocol {
    var delegate: SignInWithEmailViewModelDelegate? { get set }
    
    func signIn(with email: String?, and password: String?)
    
}

enum SignInViewModelOutput: Equatable {
    case showError(String)
    case showLoading(Bool)
}


protocol SignInWithEmailViewModelDelegate: AnyObject {
    func handleViewModelOuput(_ output: SignInViewModelOutput)
    func navigateAfterSignIn()
}
