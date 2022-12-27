//
//  FollowingTrackingSlider.swift
//  Find Your Car
//
//  Created by Vinh Pham on 9/17/22.
//

import SwiftUI

struct FollowingUserToggle: View {
    @EnvironmentObject var settings : Settings
    var body: some View {
        Toggle(isOn: $settings.followingUser) {
            Text("Following User Mode")
        }
    }
}

struct FollowingTrackingSlider_Previews: PreviewProvider {
    static var previews: some View {
        FollowingUserToggle()
    }
}
