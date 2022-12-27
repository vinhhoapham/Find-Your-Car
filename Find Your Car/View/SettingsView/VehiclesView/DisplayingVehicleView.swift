//
//  VehicleView.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/20/22.
//

import SwiftUI

struct DisplayingVehicleView: View {
    @Binding var vehicle : Vehicle
    var body: some View {
        switch vehicle.tag.type {
            case .defaultTag:
                Text("A")
            
            case .emoji:
                Text(vehicle.tag.content ?? "A")
            default:
                Text("A")
        }
    }
}

