//
//  SettingsView.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/12/22.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settings : Settings
    @EnvironmentObject var viewModel : FindYourCarViewModel
    var body: some View {
        VStack{
            Rectangle()
                .frame(width: 15, height: 15, alignment: .bottom)
                .background(settings.colorPalette.primaryColor)
            ColorPicker("Primary color ", selection: $settings.colorPalette.primaryColor)
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
