    //
    //  AddVehicleSheetView.swift
    //  Find Your Car
    //
    //  Created by Vinh Pham on 8/23/22.
    //

    import SwiftUI

    struct AddVehicleSheetView: View {
        @EnvironmentObject var settings: Settings
        @State var vehiclesName : String = "Default"
        var body: some View {
            List {
                TextField (
                    "Vehicle's name",
                    text : $vehiclesName
                )
            }
            Button(
                action : {
                    
                }
            ) {
                Image(systemName: "plus")
            }.background(settings.colorPalette.primaryColor)
    }
}

struct AddVehicleSheetView_Previews: PreviewProvider {
    static var previews: some View {
        AddVehicleSheetView()
    }
}
