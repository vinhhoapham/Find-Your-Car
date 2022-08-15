//
//  Find_Your_CarApp.swift
//  Find Your Car
//
//  Created by Vinh Pham on 7/4/22.
//

import SwiftUI
import Combine
import MetricKit

@main


struct Find_Your_CarApp: App {

    @StateObject var viewModel = FindYourCarViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewModel)
                .environmentObject(viewModel.notificationManager)
                .environmentObject(viewModel.mapManager)
                .environmentObject(viewModel.settings)
                .alertModifier()
        }
    }
    
}
