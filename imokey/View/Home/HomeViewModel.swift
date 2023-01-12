//
//  HomePageViewModel.swift
//  imokey
//
//  Created by Tugay on 27.12.2022.
//

import Foundation

final class HomeViewModel: HomeViewModelProtocol {
    func addNewMemory() {
       
        delegate?.navigateTo(to: .addNewMemory)
    }
    
    
    weak var delegate: HomeViewModelDelegate?
    
}
