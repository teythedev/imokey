//
//  LoginPageViewModel.swift
//  imokey
//
//  Created by Tugay on 19.12.2022.
//

import Foundation

final class LoginPageViewModel: LoginPageViewModelProtocol {
    
    weak var delegate: LoginPageViewModelDelagete?
    
    func selectedAction(is action: Actions?) {
        guard let action = action else { return }
        delegate?.showBottomSheet(with: action)
    }
}


