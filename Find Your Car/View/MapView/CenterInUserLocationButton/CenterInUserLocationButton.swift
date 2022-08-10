//
//  CenterInUserLocationButton.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/9/22.
//

import SwiftUI

struct CenterInUserLocationButton: View {
    var action : () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "location")
                .foregroundColor(.blue)
        }
    }
}

struct CenterInUserLocationButton_Previews: PreviewProvider {
    static var previews: some View {
        CenterInUserLocationButton() {
            print("")
        }
    }
}
