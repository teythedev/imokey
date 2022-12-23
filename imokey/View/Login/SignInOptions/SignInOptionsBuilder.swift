//
//  LoginOptionsBuilder.swift
//  imokey
//
//  Created by Tugay on 24.12.2022.
//

import Foundation

final class SignInOptionsBuilder {
    static func make() -> SignInOptionsViewController {
        let viewController = SignInOptionsViewController()
        viewController.viewModel = SignInOptionsViewModel()
        return viewController
    }
}
