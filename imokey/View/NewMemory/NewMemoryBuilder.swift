//
//  NewMemoryBuilder.swift
//  imokey
//
//  Created by Tugay on 6.01.2023.
//

import Foundation

final class NewMemoryBuilder {
    static func make(with viewModel: NewMemoryViewModelProtocol) -> NewMemoryViewController {
        let viewController = NewMemoryViewController()
        viewController.viewModel = viewModel
        return viewController
    }
    
}
