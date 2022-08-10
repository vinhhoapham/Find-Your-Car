//
//  MapViewModel.swift
//  Find Your Car
//
//  Created by Vinh Pham on 7/9/22.
//

import Foundation
import CoreLocation

enum VanillaObjects {
    static let tag = Tag(name: "vanilla", type: .defaultTag)
    static let vehicle = Vehicle(name: "vanilla", tag: tag)
}
/// This class listen from the users
/// to
///
final class FindYourCarViewModel : ObservableObject {

    var notificationManager         = NotificationManager()
    @Published var mapManager       = MapManager(vehicleLocations: [:], defaulVehicle: VanillaObjects.vehicle)
    var model                       = FindYourCarModel()
    
    

    
}
