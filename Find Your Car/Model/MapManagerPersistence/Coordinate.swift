//
//  Coordinate.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/12/22.
//

import Foundation
import CoreLocation


struct Coordinate : Codable {
    var longitude : CLLocationDegrees
    var lattitude : CLLocationDegrees
    
}

extension Coordinate {
    init(location : CLLocation) {
        let coordinate = location.coordinate
        self.longitude = coordinate.longitude
        self.lattitude = coordinate.latitude
    }
}
