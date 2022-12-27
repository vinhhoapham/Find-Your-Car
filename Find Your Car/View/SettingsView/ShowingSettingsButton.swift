//
//  SettingsButton.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/15/22.
//

import SwiftUI

struct ShowingSettingsButton: View {
    @Binding var showingSettingsView : Bool
    @EnvironmentObject var settings : Settings
    var body: some View {
        
        Button(action: {showingSettingsView = true}) {
            Image(systemName: "gearshape.fill")
                    .font(.system(size: SystemViewVariables.buttonSize))
                    .padding([.top], 50.0)
                    .padding([.leading], 10)
                    .foregroundColor(settings.colorPalette.secondaryColor)
        }
            

    }
}

