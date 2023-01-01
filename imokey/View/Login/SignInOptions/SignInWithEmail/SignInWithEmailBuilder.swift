//
//  SignInWithEmailBuilder.swift
//  imokey
//
//  Created by Tugay on 26.12.2022.
//

import Foundation

final class SignInWithEmailBuilder {
    static func make() -> SignInWithEmailViewController {
        let viewController = SignInWithEmailViewController()
        viewController.viewModel = SignInWithEmailViewModel(signInService: FirebaseSignIn())
        return viewController
    }
}
