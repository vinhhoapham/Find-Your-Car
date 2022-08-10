//
//  RemindMeButton.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/10/22.
//

import SwiftUI

struct RectangularSheetButton: View {
    var color : Color
    var label : String
    var action : () -> ()
    var body: some View {
        Button(action: action) {
            Text(label)
                .foregroundColor(.white)
        }
        .background(color)
    }
}

struct RemindMeButton_Previews: PreviewProvider {
    @EnvironmentObject var colorPalette : ColorPalette
    static var previews: some View {
        RectangularSheetButton(color: .accentColor
                               , label: "Test") {
            print("Test")
        }
    }
}
