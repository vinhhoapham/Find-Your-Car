//
//  MapManagerPersistence.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/11/22.
//

import Foundation
import MapKit


/// A wrapper of MapManager. Use this to store and load data
/// from userdefault
///
struct MapManagerPersistence : Codable {
    
    private(set) var vehiclesCoordinates    : [Vehicle : Coordinate] = [:]
    private(set) var focusingVehicle        : Vehicle?               = nil
    
    
    init() { }
    
    init(mapManager : MapManager) {
        self.focusingVehicle = mapManager.focusingVehicle
        self.vehiclesCoordinates = mapManager.vehicleLocations.mapValues { Coordinate(location: $0) }
    }
    
    init?(data: Data?) {
        guard let data = data,
            let savedPersistence = try? JSONDecoder().decode(MapManagerPersistence.self, from: data)
        else {
            return nil
        }
        
        self = savedPersistence
    }
    
}



