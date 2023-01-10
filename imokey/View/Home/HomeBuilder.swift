//
//  HomePageBuilder.swift
//  imokey
//
//  Created by Tugay on 27.12.2022.
//

import UIKit

final class HomeBuilder {
    static func make() -> UIViewController {
        let viewController = HomeViewController()
        viewController.viewModel = HomeViewModel()
//        let navigationController = UINavigationController(rootViewController: viewController)
        return viewController
    }
}
