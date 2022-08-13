//
//  Vehicle+Hashable.swift
//  Find Your Car
//
//  Created by Vinh Pham on 7/23/22.
//

import Foundation

extension Vehicle : Hashable {
    static func == (lhs: Vehicle, rhs: Vehicle) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}


