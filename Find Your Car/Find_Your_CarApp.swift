//
//  Find_Your_CarApp.swift
//  Find Your Car
//
//  Created by Vinh Pham on 7/4/22.
//

import SwiftUI

@main
struct Find_Your_CarApp: App {

    @StateObject var viewModel = FindYourCarViewModel()
    @StateObject var colorPalette = ColorPalette(primary: .red,
                                              secondary:  .blue,
                                              accent:  .green)
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewModel)
                .environmentObject(viewModel.notificationManager)
                .environmentObject(viewModel.mapManager.userLocation)
                .environmentObject(viewModel.mapManager)
                .environmentObject(colorPalette)
        }
    }
    
}
