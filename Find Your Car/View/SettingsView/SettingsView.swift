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
        NavigationView {
            List {
                AppSettingsMenu()
            }
            
        }
    }
    
}


