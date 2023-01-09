//
//  LocationServiceProtocol.swift
//  imokey
//
//  Created by Tugay on 7.01.2023.
//

import Foundation
import CoreLocation


typealias LAT = CLLocationDegrees
typealias LONG = CLLocationDegrees

protocol LocationServiceProtocol: NSObject {
    
    var delegate: LocationServiceDelegate? { get set }
    
    func requestLocation()
}

protocol LocationServiceDelegate: AnyObject {
    func getLocation(result: (Result<CLLocationCoordinate2D, Error>))
}
