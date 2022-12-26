//
//  RegisterViewModel.swift
//  imokey
//
//  Created by Tugay on 27.12.2022.
//

import Foundation

final class RegisterViewModel: RegisterViewModelProtocol {
    
    weak var delegate: RegisterViewModelDelegate?
    
    func register(with email: String?, and password: String?) {
        delegate?.handleViewModelOutput(.nilEmailOrPassword("Please"))
        delegate?.navigateToAfterRegister()
    }
}
