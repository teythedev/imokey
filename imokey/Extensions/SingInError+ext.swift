//
//  SingInError+ext.swift
//  imokey
//
//  Created by Tugay on 1.01.2023.
//

import Foundation

extension SignInError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .operationNotAllowed:
            return "Operation Not Allowed"
        case .userDisabled:
            return "The account has been disabled by an admin"
        case .invalidEmail:
            return "The email address is badly formatted."
        case .wrongPassword:
            return "The password is wrong"
        case .unexpected(code: let x):
            return "An unexpected error occurred.\(x)"
        }
    }
}
