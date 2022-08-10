//
//  File.swift
//  Find Your Car
//
//  Created by Vinh Pham on 7/22/22.
//

import Foundation
import MapKit

struct Vehicle : Identifiable {
   
    private(set) var name   : String
    private(set) var tag    : Tag
    private(set) var id     = UUID()
}

