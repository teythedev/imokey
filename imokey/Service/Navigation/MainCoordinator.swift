//
//  MainCoordinator.swift
//  imokey
//
//  Created by Tugay on 10.01.2023.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = HomeBuilder.make()
        navigationController.pushViewController(vc, animated: false)
    }
    
    
}
