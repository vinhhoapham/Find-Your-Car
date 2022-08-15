//
//  UsersPersistence.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/12/22.
//

import Foundation

class UserPersistence {
    
    typealias Key = String
    private let mapManagerKey : Key = "vinhph.FYC.mapManager"
    private let settingsKey : Key = "vinhph.FYC.settings"
    private let savedVehiclesKey : Key = "vinhph.FYC.savedVehicles"
    private let userDefaults = UserDefaults.standard
    
    func readData(key : Key) throws -> Data? {
        guard let savedData = userDefaults.data(forKey: key) else {
            return nil
        }
        
        return savedData
    }
    
    func loadSavedMapManagerPersistence() -> MapManagerPersistence? {
        
        var mapManagerInDataForm : Data?
        var savedMapManagerPersistence : MapManagerPersistence?
        do {
            mapManagerInDataForm = try readData(key: mapManagerKey)
            savedMapManagerPersistence = MapManagerPersistence(data: mapManagerInDataForm)
            
        } catch {
            print("Fail to data with key \(mapManagerKey)")
        }
        
        
        return savedMapManagerPersistence
    }
    
    func loadSavedSettings() -> Settings? {
        
        if let savedSettingsInDataForm = try? readData(key: settingsKey),
           let decodedSettings = try? JSONDecoder().decode(Settings.self, from: savedSettingsInDataForm)
        {
            return decodedSettings
        
        } else {
            return nil
        }
        
    }
    
    func update(newPersistence : MapManagerPersistence) {
        if let decodedPersistence = try? JSONEncoder().encode(newPersistence) {
            userDefaults.set(decodedPersistence, forKey: mapManagerKey)
        }
    }
    
    func update(settings: Settings) {
        if let settings = try? JSONEncoder().encode(settings) {
            userDefaults.set(settings, forKey: settingsKey)
        }
    }
    
    
}
