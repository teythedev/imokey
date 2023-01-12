//
//  Coordinator.swift
//  imokey
//
//  Created by Tugay on 10.01.2023.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set}
    var navigationController: UINavigationController { get set }
    
    func start()
}
