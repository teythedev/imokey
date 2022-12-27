//
//  AuthService.swift
//  imokey
//
//  Created by Tugay on 27.12.2022.
//

import Foundation

protocol SignInWithEmailProtocol {
    func signIn<T: Error>(withEmail email: String, password: String,  completion: @escaping(Result<User, T>) -> Void)
}

protocol RegisterWithEmailProtocol {
    func register(withEmail email: String, password: String, completion: @escaping(Result<User, RegisterError>) -> Void)
}

protocol SignInWithProviderProtocol {
    func signIn(withProvider: Provider)
}

protocol SignOutProtocol {
    func signOut()
}



