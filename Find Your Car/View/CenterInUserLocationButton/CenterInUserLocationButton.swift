//
//  CenterInUserLocationButton.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/9/22.
//

import SwiftUI

struct CenterInUserLocationButton: View {
    @EnvironmentObject var settings : Settings
    @EnvironmentObject var mapManager : MapManager
    
    var body: some View {
        
        // The action is empty to allow both tap gesture and longPressgesture
        // on this button
        Button(action: mapManager.triggerUpdate) {
            
            Image(systemName: "location")
                .font(.system(size: SystemViewVariables.buttonSize))
                .symbolVariant(settings.followingUser ? .fill : .none)
                .foregroundColor(.blue)
            
        }
        .simultaneousGesture(LongPressGesture().onEnded() { _ in
            settings.followingUser.toggle()
        })
    }
}

