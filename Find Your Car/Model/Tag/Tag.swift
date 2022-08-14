//
//  Tag.swift
//  Find Your Car
//
//  Created by Vinh Pham on 7/22/22.
//

import Foundation

enum contentType : Codable {
    case defaultTag
    case emoji
}

enum TagError : Error{
    case failedToLoadEmoji
}
struct Tag : Codable {
    var id      = UUID()
    var name    : String
    var type    : contentType
    var content : String?
}

