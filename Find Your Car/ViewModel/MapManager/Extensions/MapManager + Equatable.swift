//
//  MapManager + Equatable.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/12/22.
//

import Foundation

extension MapManager : Equatable {
    static func == (lhs: MapManager, rhs: MapManager) -> Bool {
        return lhs.vehicleLocations == rhs.vehicleLocations &&
                lhs.focusingVehicle == rhs.focusingVehicle
    }
    
    
}
