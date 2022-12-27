//
//  FirebaseSignIn.swift
//  imokey
//
//  Created by Tugay on 27.12.2022.
//

import Foundation
import FirebaseAuth

public enum RegisterError: Error {
    case operationNotAllowed
    case emailAlreadyInUse
    case invalidEmail
    case weakPassword
    case unexpected(code: Int)
}

extension RegisterError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .operationNotAllowed:
            return "Operation Not Allowed"
        case .emailAlreadyInUse:
            return "The email address is already in use by another account."
        case .invalidEmail:
            return "The email address is badly formatted."
        case .weakPassword:
            return "The password must be 6 characters long or more."
        case .unexpected(_):
            return "An unexpected error occurred."
        }
    }
}

struct FirebaseRegister: RegisterWithEmailProtocol {

    func register(withEmail email: String, password: String, completion: @escaping (Result<User, RegisterError>) -> Void)  {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            guard let userID = authResult?.user.email, let userEmail = authResult?.user.email , error == nil else {
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
