//
//  LoginPageBuilder.swift
//  imokey
//
//  Created by Tugay on 21.12.2022.
//

import Foundation

final class LoginPageBuilder {
    static func make() -> LoginPageViewController {
        let viewController = LoginPageViewController()
        viewController.viewModel = LoginPageViewModel()
        return viewController
    }
}
