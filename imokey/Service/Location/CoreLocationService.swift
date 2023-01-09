//
//  CoreLocationService.swift
//  imokey
//
//  Created by Tugay on 7.01.2023.
//

import Foundation
import CoreLocation

final class CoreLocationService: NSObject, LocationServiceProtocol {
    
    weak var delegate: LocationServiceDelegate?
    
    let locationManager = CLLocationManager()
    
    func requestLocation() {
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
    }
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    
}

extension CoreLocationService: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .denied:
            manager.requestWhenInUseAuthorization()
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        delegate?.getLocation(result: Result.failure(error))
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        manager.stopUpdatingLocation()
        guard let newCurrentLocation = locations.last else {
            return
        }
        delegate?.getLocation(result: Result.success((newCurrentLocation.coordinate)))
        
    }
}
