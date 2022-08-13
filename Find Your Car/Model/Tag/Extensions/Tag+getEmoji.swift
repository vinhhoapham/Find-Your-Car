//
//  Tag+getImageView.swift
//  Find Your Car
//
//  Created by Vinh Pham on 7/31/22.
//

import Foundation

extension Tag {
    func getEmoji() throws -> String  {
        guard let content = self.content else {
            throw TagError.failedToLoadEmoji
        }
        return content
    }
}
