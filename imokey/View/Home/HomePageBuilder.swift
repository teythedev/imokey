//
//  HomePageBuilder.swift
//  imokey
//
//  Created by Tugay on 27.12.2022.
//

import UIKit

final class HomePageBuilder {
    static func make() -> UINavigationController {
        let viewController = HomePageViewController()
        viewController.viewModel = HomePageViewModel()
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
}
