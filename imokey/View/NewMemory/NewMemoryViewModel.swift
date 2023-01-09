//
//  NewMemoryViewModel.swift
//  imokey
//
//  Created by Tugay on 6.01.2023.
//

import Foundation
import CoreLocation

final class NewMemoryViewModel: NewMemoryViewModelProtocol {
    var delegate: NewMemoryViewModelDelegate?
    
    private let locationService: LocationServiceProtocol

    init( locationService: LocationServiceProtocol) {
        self.locationService = locationService
        locationService.delegate = self
    }
    
    func requestLocation() {
        delegate?.handleViewModelOutput(.showLoading(true))
        locationService.requestLocation()
    }
    
    func saveMemory() {
        print("Memory Saved")
    }
}

extension NewMemoryViewModel: LocationServiceDelegate {
    func getLocation(result: (Result<CLLocationCoordinate2D, Error>)) {
        delegate?.handleViewModelOutput(.showLoading(false))
        switch result {
        case .success(let success):
            delegate?.handleViewModelOutput(.markTheMap(success))
        case .failure(let failure):
            delegate?.handleViewModelOutput(.showErrorAlert(failure.localizedDescription))
        }
    }
    
    
}
