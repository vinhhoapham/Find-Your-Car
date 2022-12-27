//
//  AddVehicleButton.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/23/22.
//

import SwiftUI

struct AddVehicleButton: View {
    @EnvironmentObject var settings: Settings
    @State var showingAddVehicleSheet = false
    var body: some View {
        Button(
            action: { showingAddVehicleSheet = true }
        ) {
            Image(systemName: "plus")
                .background(settings.colorPalette.primaryColor)
        }.sheet(isPresented: $showingAddVehicleSheet) {
            AddVehicleSheetView()
        }
    }
}

struct AddVehicleButton_Previews: PreviewProvider {
    static var previews: some View {
        AddVehicleButton()
    }
}
