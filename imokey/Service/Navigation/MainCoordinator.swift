//
//  MainCoordinator.swift
//  imokey
//
//  Created by Tugay on 10.01.2023.
//

import UIKit

class MainCoordinator: NSObject ,Coordinator {
    lazy var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = HomeBuilder.make()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
        navigationController.delegate = self
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}

extension MainCoordinator: AddingNewMemoryCoordinator {
    func addNewMemory() {
        let child = NewMemoryCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
}

extension MainCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if let newMemoryCoordinator = fromViewController as? NewMemoryViewController {
            childDidFinish(newMemoryCoordinator.coordinator)
        }
    }
}
