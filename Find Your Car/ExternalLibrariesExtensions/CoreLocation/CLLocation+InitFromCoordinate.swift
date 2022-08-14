//
//  CoreLocation.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/12/22.
//

import Foundation
import CoreLocation

extension CLLocation {
    convenience init(coordinate : Coordinate) {
        self.init(latitude: coordinate.lattitude, longitude: coordinate.longitude)
    }
}
