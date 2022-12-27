//
//  UserControlView.swift
//  Find Your Car
//
//  Created by Vinh Pham on 9/25/22.
//

import SwiftUI

struct UserControlView: View {
    @State var showingSettingsView = false
    var body: some View {
        VStack {
            ShowingSettingsButton(showingSettingsView: $showingSettingsView)
            
            CenterInUserLocationButton()
                .sheet(isPresented: $showingSettingsView) {
                    SettingsView()
                }
        }
        
    }
}

struct UserControlView_Previews: PreviewProvider {
    static var previews: some View {
        UserControlView()
    }
}
