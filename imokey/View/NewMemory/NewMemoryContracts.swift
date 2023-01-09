//
//  NewMemoryContracts.swift
//  imokey
//
//  Created by Tugay on 6.01.2023.
//

import Foundation
import CoreLocation

protocol NewMemoryViewModelProtocol {
    var delegate: NewMemoryViewModelDelegate? { get set }
    
    func requestLocation()
    
    func saveMemory()
}

enum NewMemoryViewModelOutput: Equatable {
    
    case markTheMap(CLLocationCoordinate2D)
    case showLoading(Bool)
    case showErrorAlert(String)
}

protocol NewMemoryViewModelDelegate: AnyObject {
    func popView()
    func handleViewModelOutput(_ output: NewMemoryViewModelOutput)
}

extension CLLocationCoordinate2D: Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        lhs.longitude == rhs.longitude && lhs.latitude == lhs.longitude
    }
    
    
}
