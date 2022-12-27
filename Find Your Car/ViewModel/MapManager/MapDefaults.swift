//
//  MapDefults.swift
//  Find Your Car
//
//  Created by Vinh Pham on 7/27/22.
//

import Foundation
import MapKit

enum MapDefaults {
    static let longitudeSpan     = 0.0005
    static let lattitudeSpan     = 0.0005
    static let paddingSpan       = 0.00015
    static let span              = MKCoordinateSpan(
                                    latitudeDelta: MapDefaults.longitudeSpan,
                                    longitudeDelta: MapDefaults.lattitudeSpan
                                    )
    static let displayingRegion = MKCoordinateRegion(
        center: LocationDefault.defaultLocation.coordinate,
        span: MapDefaults.span
    )
}

