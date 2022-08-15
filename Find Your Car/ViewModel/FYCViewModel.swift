//
//  MapViewModel.swift
//  Find Your Car
//
//  Created by Vinh Pham on 7/9/22.
//

import Foundation
import CoreLocation
import Combine

/// This class listen from the users
/// to
///
final class FindYourCarViewModel : ObservableObject {

    var notificationManager                 = NotificationManager()
    var mapManager                          : MapManager
    private var model                       : FindYourCarModel
    var settings                            : Settings
    
    var mapManagerUpdateListener : AnyCancellable?
    var settingsUpdateListener    : AnyCancellable?
    
    init() {
        
        
        model = FindYourCarModel()
        mapManager = MapManager(persitence: model.mapManagerPersistence)
        settings = model.savedSettings
        
        mapManagerUpdateListener = mapManager.objectWillChange.sink { [unowned self] in
            self.saveAllData()
        }
        
        settingsUpdateListener = settings.objectWillChange.sink { [unowned self] in
            self.model.update(settings: settings)
        }
        
    }
    
    
    func saveAllData() {
        
        DispatchQueue.global(qos: .background).async { [unowned self] in
            
            self.model.update(settings: settings)
            self.model.update(persistence: MapManagerPersistence(mapManager: mapManager))

        }
    }
    
}
