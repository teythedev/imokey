//
//  NewMemoryCoordinator.swift
//  imokey
//
//  Created by Tugay on 12.01.2023.
//

import UIKit

class NewMemoryCoordinator: Coordinator {
    
    weak var parentCoordinator: AddingNewMemoryCoordinator?
    
    lazy var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init (navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = NewMemoryBuilder.make()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}
