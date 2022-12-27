//
//  CircleButton.swift
//  Find Your Car
//
//  Created by Vinh Pham on 7/28/22.
//

import Foundation
import SwiftUI

struct CircleButton : View {
    var radius  : CGFloat
    var color   : Color = .mint
    var action  : () -> Void
    
    var body: some View {
        Button(action: action) {
           Circle()
                .fill(color)
                .opacity(0.75)
        }
        .frame(width: radius, height: radius)
        .overlay(
            Circle()
                .stroke(.white, lineWidth: 10)
        )
        
    }
}

struct CircleButton_Preview : PreviewProvider {
    static var previews: some View {
        CircleButton(radius: 15) {
            print("Hello")
        }
    }
}
