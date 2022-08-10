//
//  MapManager+FindVehicleWithCoordinate.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/4/22.
//

import Foundation
import CoreLocation

extension MapManager {
    func findVehicle(with coordinate: CLLocationCoordinate2D) -> Vehicle? {
        
        for (vehicle, location) in self.vehicleLocations {
            if location.coordinate == coordinate { return vehicle}
        }
        
        return nil
        
    }
}
