//
//  LoginOptionsBuilder.swift
//  imokey
//
//  Created by Tugay on 24.12.2022.
//

import UIKit

final class SignInOptionsBuilder {
    static func make() -> UINavigationController {
        let viewController = SignInOptionsViewController()
        viewController.viewModel = SignInOptionsViewModel()
        let navController = UINavigationController(rootViewController: viewController)
        return navController
    }
}
