//
//  RadiatingAnimation.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/8/22.
//

import Foundation
import SwiftUI

struct CircularRadiatingAnimation : ViewModifier {
    @State var animationAmount = 1.0
    var color : Color
    func body(content: Content) -> some View {
        content
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(color)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeInOut(duration: 1)
                        .repeatForever(autoreverses: false),
                        value: animationAmount
                    )
            )
            .onAppear {
                animationAmount = 2
            }
    }
}
