//
//  File.swift
//  
//
//  Created by Enrique Perez Velasco on 14/07/2020.
//

import Foundation

extension Dictionary {
    func merge(_ dict: [Key: Value]) -> [Key: Value] {
        var newDict = self
        for (k, v) in dict {
            newDict.updateValue(v, forKey: k)
        }
        return newDict
    }
}
