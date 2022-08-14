//
//  SwiftUIView.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/9/22.
//

import SwiftUI

class ColorPalette : ObservableObject, Codable {
    var primaryColor : Color
    var secondaryColor : Color
    var accentColor    : Color
    
    init (primary: Color, secondary: Color, accent : Color) {
        self.primaryColor = primary
        self.secondaryColor = secondary
        self.accentColor = accent
    }
    
}
