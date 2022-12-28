//
//  RegisterError.swift
//  imokey
//
//  Created by Tugay on 29.12.2022.
//

import Foundation

public enum RegisterError: Error {
    case operationNotAllowed
    case emailAlreadyInUse
    case invalidEmail
    case weakPassword
    case unexpected(code: Int)
}
