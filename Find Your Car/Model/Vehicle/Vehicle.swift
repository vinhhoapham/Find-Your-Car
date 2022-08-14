//
//  File.swift
//  Find Your Car
//
//  Created by Vinh Pham on 7/22/22.
//

import Foundation
import MapKit

class Vehicle : Identifiable, Codable, ObservableObject {
   
    private(set) var name   : String
    private(set) var tag    : Tag
    private(set) var id     = UUID()
    
    init(name: String, tag : Tag) {
        self.name = name
        self.tag  = tag
    }
}

