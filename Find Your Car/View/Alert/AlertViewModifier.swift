//
//  AlertViewModifier.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/15/22.
//

import SwiftUI

struct AlertModifier : ViewModifier {
    
    @State var showingAlert = false
    @State var displayingAlert : Alert?
    
    func body(content: Content) -> some View {
        content
            .onReceive(alertSystem.publisher) { alert in
                showingAlert = true
                displayingAlert = alert
            }
            .alert("",isPresented: $showingAlert, presenting: displayingAlert) { alert in
                Button(role: .destructive) {
                    
                } label: {
                    Text("Dismiss")
                }
            }
            message: { alert in
                AlertView(alert: alert)
            }
        
    }
}

extension View {
    func alertModifier() -> some View {
        modifier(AlertModifier())
    }
}
