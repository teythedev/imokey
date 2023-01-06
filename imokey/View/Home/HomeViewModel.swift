//
//  HomePageViewModel.swift
//  imokey
//
//  Created by Tugay on 27.12.2022.
//

import Foundation

final class HomeViewModel: HomeViewModelProtocol {
    func addNewMemory() {
        let viewModel = NewMemoryViewModel()
        delegate?.navigateTo(to: .addNewMemory(viewModel))
    }
    
    
    weak var delegate: HomeViewModelDelegate?
    
}
