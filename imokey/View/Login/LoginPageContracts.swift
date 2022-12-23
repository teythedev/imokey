//
//  LoginPageContracts.swift
//  imokey
//
//  Created by Tugay on 19.12.2022.
//

import Foundation

protocol LoginPageViewModelProtocol {
    var delegate: LoginPageViewModelDelagete? {get set}
    func selectedAction(is action: Actions?)
}

enum Actions: Int {
    case signInAction
    case registerAction
}

protocol LoginPageViewModelDelagete: AnyObject {
    func showBottomSheet(with action: Actions)
}
