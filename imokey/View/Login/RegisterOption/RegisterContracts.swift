//
//  RegisterContracts.swift
//  imokey
//
//  Created by Tugay on 27.12.2022.
//

import Foundation

protocol RegisterViewModelProtocol {
    var delegate: RegisterViewModelDelegate? { get set }
    
    func register(with email: String?, and password: String?)
}

enum RegisterViewModelOutput: Equatable {
    case showErrorAlert(String)
    case showLoading(Bool)
}

protocol RegisterViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: RegisterViewModelOutput)
    func navigateToAfterRegister()
}
