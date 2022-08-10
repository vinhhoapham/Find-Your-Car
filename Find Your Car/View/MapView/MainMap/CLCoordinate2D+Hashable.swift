//
//  CLCoordinate2D+Hashable.swift
//  Find Your Car
//
//  Created by Vinh Pham on 7/31/22.
//

import Foundation
import MapKit

extension CLLocationCoordinate2D : Hashable {
    
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(latitude)
        hasher.combine(longitude)
    }
    
}

