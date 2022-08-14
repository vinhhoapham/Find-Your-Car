//
//  MapView.swift
//  Find Your Car
//
//  Created by Vinh Pham on 7/22/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @EnvironmentObject var mapManager : MapManager
    @EnvironmentObject var locationManager : LocationManager
    @EnvironmentObject var settings : Settings
    
    var geoCoder = CLGeocoder()
    @Binding var showingRemindToPickUpSheet : Bool
    
    @State var refreshingPublisher : Timer.TimerPublisher
    let mainButtonRadius : CGFloat = 20.0
    
    init(refreshingInterval : Double = 15.0, showingRemindToPickUpSheet: Binding<Bool>) {
        refreshingPublisher = Timer.publish( every: refreshingInterval,
                                             on   : .main,
                                             in   : .default)
        
        self._showingRemindToPickUpSheet = showingRemindToPickUpSheet
        _ = refreshingPublisher.connect()
        
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            
            
            
            MainMap()
                .onAppear {
                    mapManager.requestUsersLocationAccess()
                }
                .onReceive(refreshingPublisher) { _ in
                    mapManager.triggerUpdate()
                }
            HStack {
                
                CenterInUserLocationButton(action: mapManager.triggerUpdate)
                
                if mapManager.focusingVehicle == settings.defaultVehicle && mapManager.focusingVehicleIsCloseToUsersLocation {
                        CircleButton(radius: mainButtonRadius) {
                            // We can safely force-unwrap this because toggle's variable
                            // has make sure that the focusingVehicle is not nil
                            try! mapManager.unmarkFocusingVehicle()
                        
                    }
                } else {
                    CircleButton(radius: mainButtonRadius, color: settings.colorPalette.primaryColor) {
                        mapManager.mark(vehicle: settings.defaultVehicle)
                        showingRemindToPickUpSheet = true
                    }
                    
                    
                    
                }
                
                
            }
            
        }
        
    }
    
    
}
