//
//  LoadingBuilder.swift
//  imokey
//
//  Created by Tugay on 28.12.2022.
//

import Foundation

final class LoadingBuilder {
    static func make() -> LoadingViewController {
        let viewController = LoadingViewController()
        viewController.modalPresentationStyle = .overCurrentContext
        viewController.modalTransitionStyle = .crossDissolve
        return viewController
    }
}
