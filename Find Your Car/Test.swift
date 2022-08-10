//
//  Test.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/5/22.
//

import SwiftUI

struct Test: View {
    struct PlayButton: View {
        @Binding var isPlaying: Bool

        var body: some View {
            Button(isPlaying ? "Pause" : "Play") {
                isPlaying.toggle()
            }
        }
    }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
