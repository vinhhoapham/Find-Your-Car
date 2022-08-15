//
//  AlertView.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/15/22.
//

import SwiftUI

struct AlertView: View {
    
    let alert : Alert
    var body: some View {
        switch alert.type {
            case .announcement:
                Text("\(alert.message)")
            case .error:
                Text("\(alert.message)")
        }
    }
    
}


    
