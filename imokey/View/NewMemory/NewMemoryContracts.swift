//
//  NewMemoryContracts.swift
//  imokey
//
//  Created by Tugay on 6.01.2023.
//

import Foundation

protocol NewMemoryViewModelProtocol {
    var delegate: NewMemoryViewModelDelegate? { get set }
    
    func getCurrentLocation()
    
    func saveMemory()
}

enum NewMemoryViewModelOutput: Equatable {
    case showLoading(Bool)
    case showErrorAlert(String)
}

protocol NewMemoryViewModelDelegate: AnyObject {
    func popView()
    func handleViewModelOutput(_ output: NewMemoryViewModelOutput)
}
