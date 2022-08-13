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
class MapManagerPersistence : Codable {
    
    private(set) var defaultVehicle      : Vehicle = VanillaObjects.vehicle
    private(set) var vehicleLocations    : [Vehicle : CLLocationCoordinate2D] = [:]
    private(set) var focusingVehicle     : Vehicle? = nil
    
}



