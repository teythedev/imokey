//
//  FirebaseSignIn.swift
//  imokey
//
//  Created by Tugay on 29.12.2022.
//

import Foundation
import FirebaseAuth

struct FirebaseSignIn: SignInWithEmailProtocol {
    func signIn(withEmail email: String, password: String, completion: @escaping (Result<User, SignInError>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password){ (authResult, error) in
            guard let userID = authResult?.user.uid, let userEmail = authResult?.user.email, error == nil else {
                guard let authError = error as? NSError else {return}
                var signInError: SignInError
                switch AuthErrorCode(_nsError: authError).code {
                case .operationNotAllowed:
                    signInError = SignInError.operationNotAllowed
                case .userDisabled:
                    signInError = SignInError.userDisabled
                case .invalidEmail:
                    signInError = SignInError.invalidEmail
                case .wrongPassword:
                    signInError = SignInError.wrongPassword
                default:
                    signInError = SignInError.unexpected(code: 0)
                }
                completion(.failure(signInError))
                return
            }
            completion(.success(User(userID: userID, userEmail: userEmail)))
        }
    }
    
    
}
