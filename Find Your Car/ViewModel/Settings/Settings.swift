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

class Settings : Codable, ObservableObject {
    @Published var defaultVehicle : Vehicle = VanillaObjects.vehicle
    @Published var colorPalette : ColorPalette = DefaultSettings.colorPalette

}
