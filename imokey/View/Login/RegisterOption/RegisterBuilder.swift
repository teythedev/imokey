//
//  RegisterBuilder.swift
//  imokey
//
//  Created by Tugay on 27.12.2022.
//

import Foundation

final class RegisterBuilder {
    static func make() -> RegisterViewController {
        let viewController = RegisterViewController()
        viewController.viewModel = RegisterViewModel()
        return viewController
    }
}
