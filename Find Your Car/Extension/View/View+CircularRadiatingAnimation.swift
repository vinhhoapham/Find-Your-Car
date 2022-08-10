//
//  View+CircularRadiatingAnimation.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/8/22.
//

import SwiftUI

extension View {
    func circularRadiatingAnimation(color: Color) -> some View{
        modifier(CircularRadiatingAnimation(color: color))
    }
}
