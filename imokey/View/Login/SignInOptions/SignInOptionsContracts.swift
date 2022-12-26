//
//  LoginOptionsContracts.swift
//  imokey
//
//  Created by Tugay on 24.12.2022.
//

import Foundation

protocol SignInOptionsViewModelProtocol {
    var delegate: SignInOptionsViewModelDelegate? { get set }
    
    func signIn(with option: SelectionOptions)
}

enum SelectionOptions: Int {
    case apple
    case google
    case facebook
    case email
}

protocol SignInOptionsViewModelDelegate: AnyObject {
    func selected(option: SelectionOptions?)
    
    
    func navigateToEmailSignIn()
}
