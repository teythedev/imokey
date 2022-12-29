//
//  AuthService.swift
//  imokey
//
//  Created by Tugay on 27.12.2022.
//

import Foundation

protocol SignInWithEmailProtocol {
    func signIn(withEmail email: String, password: String,  completion: @escaping(Result<User, SignInError>) -> Void)
}

protocol RegisterWithEmailProtocol {
    func register(withEmail email: String, password: String, completion: @escaping(Result<User, RegisterError>) -> Void)
}

protocol SignInWithProviderProtocol {
    func signIn(withProvider: SignInProvider)
}

protocol SignOutProtocol {
    func signOut()
}



