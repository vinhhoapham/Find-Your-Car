//
//  Model.swift
//  Find Your Car
//
//  Created by Vinh Pham on 7/20/22.
//

import Foundation
import CoreLocation

class FindYourCarModel {
    private let savedVehicleLocationsKey = "vinhph.FYO.vehicleLocations"
    private let focusingVehicleKey  = "vinhph.FYO.focusingVehicle"

    var savedVehicleLocations : [Vehicle : CLLocation]
    var focusingVehicle : Vehicle?
    var userDefaults = UserDefaults.standard
    
    
    init() {
        savedVehicleLocations = userDefaults.object(forKey: savedVehicleLocationsKey)
                            as? [Vehicle : CLLocation]  ?? [:]
        focusingVehicle = userDefaults.object(forKey: focusingVehicleKey)
                            as? Vehicle ?? nil
    }

    func updateVehicleLocations(with locations: [Vehicle: CLLocation]) {
        self.savedVehicleLocations = locations
    }
    
    func removeFocusingVehicle() {
        self.focusingVehicle = nil
    }
    
    func changeFocusingVehicle(to vehicle: Vehicle){
        self.focusingVehicle = vehicle
    }
    
}
