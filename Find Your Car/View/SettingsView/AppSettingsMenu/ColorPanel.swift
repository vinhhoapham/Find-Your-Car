//
//  ColorPanel.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/17/22.
//

import SwiftUI

struct ColorPanel: View {
    @EnvironmentObject var settings : Settings
    var body: some View {
        ColorPicker("Primary Color", selection: $settings.colorPalette.primaryColor)
        ColorPicker("Secondary Color", selection: $settings.colorPalette.secondaryColor)
        ColorPicker("Accent Color", selection: $settings.colorPalette.accentColor)

    }
}

struct ColorPanel_Previews: PreviewProvider {
    static var previews: some View {
        ColorPanel()
    }
}
