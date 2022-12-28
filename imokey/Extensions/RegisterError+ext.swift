//
//  RegisterError+ext.swift
//  imokey
//
//  Created by Tugay on 29.12.2022.
//

import Foundation

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
