//
//  HomePageContracts.swift
//  imokey
//
//  Created by Tugay on 27.12.2022.
//

import Foundation

protocol HomeViewModelProtocol {
    var delegate: HomeViewModelDelegate? { get set }
    
    func addNewMemory()
}

enum HomeViewModelOutput: Equatable {
    case showLoading(Bool)
    case showErrorAlert(String)
}

enum HomeViewRoute {
    case addNewMemory(NewMemoryViewModel)
}

protocol HomeViewModelDelegate: AnyObject {
    func navigateTo(to route: HomeViewRoute)
}
