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
    @EnvironmentObject var settings : Settings
    
    @Binding var showingRemindToPickUpSheet : Bool
    
    @State var refreshingPublisher : Timer.TimerPublisher
    @State var refreshingInterval : Double
    
    init(refreshingTime : Double = 5.0, showingRemindToPickUpSheet: Binding<Bool>) {
        refreshingInterval = refreshingTime
        refreshingPublisher = Timer.publish( every: refreshingTime,
                                             on   : .main,
                                             in   : .default)
        
        _showingRemindToPickUpSheet = showingRemindToPickUpSheet
        
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            MainMap()
                .onAppear {
                    mapManager.requestUsersLocationAccess()
                }
                .onReceive(refreshingPublisher) { _ in
                    print(settings.followingUser)
                    mapManager.triggerUpdate()
                    
                }
                .onChange(of: settings.followingUser) { newFollowingUserMode in
                    if newFollowingUserMode {
                        refreshingPublisher = Timer.publish(
                                                            every: refreshingInterval,
                                                            on   : .main,
                                                            in   : .default
                                                        )
                        _ = refreshingPublisher.connect()
                    } else {
                        _ = refreshingPublisher.connect().cancel()
                    }
                    
                }
            
            
            VStack {
                Spacer()
                if let directionToUserLocation = mapManager.usersLocationVerticalDirectionToFocusingVehicle {
                    switch directionToUserLocation {
                        case .higher:
                            Image(systemName: "arrow.up")
                        case .lower:
                            Image(systemName: "arrow.down")
                        case .same:
                            EmptyView()
                    }
                }
            }
            .padding(.top, 50)
            
            HStack(alignment: .bottom)  {
                
                if mapManager.focusingVehicle == settings.defaultVehicle && mapManager.focusingVehicleIsCloseToUsersLocation {
                    
                    CircleButton(
                        radius: SystemViewVariables.buttonSize,
                        color : .green
                    ) {
                        // We can safely force-unwrap this because toggle's variable
                        // has make sure that the focusingVehicle is not nil
                        try! mapManager.unmarkFocusingVehicle()
                        
                    }.circularRadiatingAnimation(color: .green)
                    
                } else {
                    
                    CircleButton(
                        radius: SystemViewVariables.buttonSize,
                        color: settings.colorPalette.primaryColor
                    ) {
                        
                        mapManager.mark(vehicle: settings.defaultVehicle)
                        showingRemindToPickUpSheet = true
                        
                    }
                    
                    
                    
                }
                
                
            }
            .padding(.bottom, 30.0)
            
            
        }
        
    }
    
    
}
