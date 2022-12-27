//
//  RegisterViewModel.swift
//  imokey
//
//  Created by Tugay on 27.12.2022.
//

import Foundation

final class RegisterViewModel: RegisterViewModelProtocol {
    
    weak var delegate: RegisterViewModelDelegate?
    private let registerService: RegisterWithEmailProtocol
    
    init (registerService: RegisterWithEmailProtocol){
        self.registerService = registerService
    }
    
    func register(with email: String?, and password: String?) {
        delegate?.handleViewModelOutput(.showLoading(true))
        registerService.register(withEmail: email!, password: password!) { [weak self] ( result: Result<User,RegisterError> )in
            self?.delegate?.handleViewModelOutput(.showLoading(false))
            switch result {
            case .success(let success):
                print("User successfully registered: \(success.userEmail) and \(success.userID)")
            case .failure(let failure):
                print(failure.description)
                self?.delegate?.handleViewModelOutput(.showErrorAlert(failure.description))
            }}
        //delegate?.handleViewModelOutput(.nilEmailOrPassword("Please"))
       // delegate?.navigateToAfterRegister()
    }
}
