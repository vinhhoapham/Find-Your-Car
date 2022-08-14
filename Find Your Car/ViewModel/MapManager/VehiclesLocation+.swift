//
//  VehiclesLocation+.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/12/22.
//

import Foundation
import CoreLocation

extension VehicleLocations {
    init(vehicleCoordinates : [Vehicle : Coordinate]) {
        self = vehicleCoordinates.mapValues { CLLocation(coordinate: $0) }
    }
}
