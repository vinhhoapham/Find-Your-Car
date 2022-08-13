//
//  Tag+Hashable.swift
//  Find Your Car
//
//  Created by Vinh Pham on 7/23/22.
//

import Foundation

extension Tag : Hashable {
    static func == (lhs: Tag, rhs: Tag) -> Bool {
        lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
