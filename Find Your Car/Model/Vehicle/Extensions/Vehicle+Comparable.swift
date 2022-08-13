//
//  Vehicle+Comparable.swift
//  Find Your Car
//
//  Created by Vinh Pham on 7/23/22.
//

import Foundation

extension Vehicle : Comparable {
    static func < (lhs: Vehicle, rhs: Vehicle) -> Bool {
        lhs.hashValue < rhs.hashValue
    }
    
    
}
