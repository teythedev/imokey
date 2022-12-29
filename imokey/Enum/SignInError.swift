//
//  SignInError.swift
//  imokey
//
//  Created by Tugay on 29.12.2022.
//

import Foundation

public enum SignInError: Error {
    case operationNotAllowed
    case userDisabled
    case invalidEmail
    case wrongPassword
    case unexpected(code: Int)
}
