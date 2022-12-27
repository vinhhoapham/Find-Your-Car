//
//  UpperSettingsMenu.swift
//  Find Your Car
//
//  Created by Vinh Pham on 9/23/22.
//

import SwiftUI

struct AppSettingsMenu: View {
    var body: some View {
        Section(
            content: {
                ColorPanel()
                FollowingUserToggle()
            }, header: {
                Text("System Settings")
            }, footer: {
                
            }
        )
    }
}

