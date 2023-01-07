//
//  LocationServiceProtocol.swift
//  imokey
//
//  Created by Tugay on 7.01.2023.
//

import Foundation
import CoreLocation

protocol LocationServiceProtocol: NSObject {
    
    var delegate: LocationServiceDelegate? { get set }
    
    func requestLocation()
}

protocol LocationServiceDelegate: AnyObject {
    func getLocation(result: (Result<CLLocation, Error>))
}


class deneme: LocationServiceDelegate {
    func getLocation(result: (Result<CLLocation, Error>)) {
        switch result {
        case .success(let location):
            print(location)
        case .failure(let failure):
            print(failure.localizedDescription)
        }
    }
}
