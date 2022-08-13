//
//  Dictionary+FindKeyWithValue.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/2/22.
//

import Foundation

extension Dictionary where Value: Equatable {
    func findKey(with targetValue: Value) -> Key?  {
        for (key, value) in self {
            if value == targetValue { return key }
        }
        return nil
    }
}
