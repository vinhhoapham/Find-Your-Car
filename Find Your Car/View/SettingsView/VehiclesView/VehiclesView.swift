//
//  VehiclesView.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/17/22.
//

import SwiftUI

struct VehiclesView: View {
    @EnvironmentObject var settings : Settings
    @EnvironmentObject var viewModel : FindYourCarViewModel
    var body: some View {
        ForEach($settings.vehicles) { $vehicle in
            
            DisplayingVehicleView(vehicle: $vehicle)
        }
        
        
        AddVehicleButton()
        
        
        
    }
}


