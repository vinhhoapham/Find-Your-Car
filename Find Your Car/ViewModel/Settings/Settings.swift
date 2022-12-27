//
//  Options.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/10/22.
//

import Foundation

enum DefaultSettings {
    static let colorPalette = ColorPalette(primary: .blue, secondary: .red, accent: .green)
}

enum SettingsError : Error {
    case vehicleNotFound
}

class Settings : ObservableObject , Codable {
    
    enum SettingsCodingKeys : String, CodingKey {
        case defaultVehicle
        case colorPalette
        case vehicles
        case followingUser
    }
    
    @Published private(set) var defaultVehicle    : Vehicle = DefaultObject.vehicle
    @Published var colorPalette                   : ColorPalette = DefaultSettings.colorPalette
    @Published  var vehicles          : [Vehicle] = [DefaultObject.vehicle]
    
    @Published var followingUser : Bool = true
    
    init() {}
    
    // MARK : Encodable conformance
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: SettingsCodingKeys.self)
        try container.encode(defaultVehicle, forKey: .defaultVehicle)
        try container.encode(colorPalette, forKey: .colorPalette)
        try container.encode(vehicles, forKey: .vehicles)
        try container.encode(followingUser, forKey: .followingUser)
    }
    
    required init(from decoder: Decoder) throws {
        let decodedValues = try decoder.container(keyedBy: SettingsCodingKeys.self)
        
        defaultVehicle = try decodedValues.decode(Vehicle.self, forKey: .defaultVehicle)
        colorPalette   = try decodedValues.decode(ColorPalette.self, forKey: .colorPalette)
        vehicles       = try decodedValues.decode([Vehicle].self, forKey: .vehicles)
        
        followingUser = try decodedValues.decode(Bool.self, forKey: .followingUser)
        
    }
    
    func setDefaultVehicle(to vehicle : Vehicle) throws {
        guard vehicles.contains(vehicle) else {
            throw SettingsError.vehicleNotFound
        }
        defaultVehicle = vehicle
    }
    
    func remove(vehicle: Vehicle) {
        vehicles.removeAll { $0 == vehicle}
    }
    
    func add(vehicle: Vehicle){
        vehicles.append(vehicle)
    }
    
    
    
    
}
