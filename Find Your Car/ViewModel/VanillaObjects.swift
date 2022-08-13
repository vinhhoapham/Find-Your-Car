//
//  VanillaObject.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/11/22.
//

import Foundation

enum VanillaObjects {
    static let tag = Tag(name: "vanilla", type: .defaultTag)
    static let vehicle = Vehicle(name: "vanilla", tag: tag)
}
