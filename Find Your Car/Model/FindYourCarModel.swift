//
//  Model.swift
//  Find Your Car
//
//  Created by Vinh Pham on 7/20/22.
//

import Foundation
import CoreLocation

enum DataError : Error {
        case failToFindData
        case failToLoadObject
}

class FindYourCarModel {
    
        
    private(set) var mapManagerPersistence : MapManagerPersistence
    private(set) var savedSettings : Settings
    private var usersPeristence = UserPersistence()
    
    init() {
        mapManagerPersistence = usersPeristence.loadSavedMapManagerPersistence() ??
                                 MapManagerPersistence()
        
        savedSettings = usersPeristence.loadSavedSettings() ?? Settings()
                
    }
    
    func update(persistence: MapManagerPersistence) {
        usersPeristence.update(newPersistence: persistence)
    }
    
    func update(settings : Settings) {
        usersPeristence.update(settings: settings)
    }
    
    
    
}
