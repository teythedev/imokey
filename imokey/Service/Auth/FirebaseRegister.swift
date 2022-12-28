//
//  FirebaseSignIn.swift
//  imokey
//
//  Created by Tugay on 27.12.2022.
//

import Foundation
import FirebaseAuth

struct FirebaseRegister: RegisterWithEmailProtocol {

    func register(withEmail email: String, password: String, completion: @escaping (Result<User, RegisterError>) -> Void)  {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            guard let userID = authResult?.user.uid, let userEmail = authResult?.user.email , error == nil else {
                guard let authError = error as? NSError else {return}
                switch AuthErrorCode(_nsError: authError).code {
                case .operationNotAllowed:
                    completion(.failure(RegisterError.operationNotAllowed))
                case .emailAlreadyInUse:
                    completion(.failure(RegisterError.emailAlreadyInUse))
                case .invalidEmail:
                    completion(.failure(RegisterError.invalidEmail))
                case .weakPassword:
                    completion(.failure(RegisterError.weakPassword))
                default:
                    completion(.failure(RegisterError.unexpected(code: 0)))
                }
                return
            }
            completion(.success(User(userID: userID, userEmail: userEmail)))
        }
    }
}
