//
//  Encodable+Extension.swift
//  
//
//  Created by Hussam Elsadany on 02/04/2023.
//

import Foundation

public extension Encodable {
    var storeData: Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }
}
