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
    @EnvironmentObject var viewModel : FindYourCarViewModel
    
    var body: some View {
        VStack {
            
            Form {
                Text(title)
                DatePicker( "Time", selection: $timeToPickUpVehicle)
            }
                .background(.white)
                .frame(height: 180)
            HStack {
                RectangularSheetButton(color: .red, label: "Cancel") { isShowing = false }
                
                RectangularSheetButton(color: .green, label: "Remind me") {
                    viewModel.scheduleARemindToPickUpNotification(at: timeToPickUpVehicle)
                    isShowing = false
                }
                
            }
            
        }
    }
}

