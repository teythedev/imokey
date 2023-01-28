//
//  NewMemoryBuilder.swift
//  imokey
//
//  Created by Tugay on 6.01.2023.
//

import Foundation

final class NewMemoryBuilder {
    static func make() -> NewMemoryViewController {
        let locationService = CoreLocationService()
        let audioService = AudioService()
        let viewModel = NewMemoryViewModel(locationService: locationService, audioService: audioService)
        let viewController = NewMemoryViewController()
        viewController.viewModel = viewModel
        return viewController
    }
    
}
