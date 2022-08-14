//
//  SheetView.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/9/22.
//

import SwiftUI

struct ScheduleReminderSheetView: View {
    let title = "Remind me to pick up my vehicle at"
    
    @Binding var isShowing : Bool 
    @State var timeToPickUpVehicle : Date = Date()
    @EnvironmentObject var notificationManager : NotificationManager
    
    var body: some View {
        VStack {
            
            Text(title)
            DatePicker("Pick Date", selection: $timeToPickUpVehicle)
            
            HStack {
                RectangularSheetButton(color: .red, label: "Cancel") { isShowing = false }
                
                RectangularSheetButton(color: .green, label: "Remind me") {
                    
                    DispatchQueue.main.async {
                        
                        notificationManager.scheduleANotification(time: timeToPickUpVehicle, content: NotificationDefault.content)

                    }
                    
                    isShowing = false
                }
            }
        }
    }
}

