//
//  AlertSystem.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/14/22.
//

import Foundation
import SwiftUI
import Combine


var alertSystem = AlertSystem()

class AlertSystem {
    var publisher = PassthroughSubject<Alert, Never>()
    
    init() {
        
    }
    
    func send(alert: Alert) {
        publisher.send(alert)
    }
    
}
