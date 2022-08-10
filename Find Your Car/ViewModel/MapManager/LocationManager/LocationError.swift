//
//  LocationError.swift
//  Find Your Car
//
//  Created by Vinh Pham on 7/26/22.
//

import Foundation

enum LocationError : Error {
    case permissionUndetermined
    case permissionRestricted
    case permissionDenied
    case managerNotInitialzed
    case currentLocationDidNotInitalized
}
