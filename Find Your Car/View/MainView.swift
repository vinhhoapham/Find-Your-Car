//
//  ContentView.swift
//  Find Your Car
//
//  Created by Vinh Pham on 7/4/22.
//

import SwiftUI
import CoreData
import MapKit
import Combine

struct MainView: View {
    @State var showingRemindToPickUpSheet = false
    
    var body: some View {
        
        MapView(showingRemindToPickUpSheet: $showingRemindToPickUpSheet)
            .sheet(isPresented: $showingRemindToPickUpSheet) {
               ScheduleReminderSheetView(isShowing: $showingRemindToPickUpSheet)
            }
        
        SettingsView()
    }
}
