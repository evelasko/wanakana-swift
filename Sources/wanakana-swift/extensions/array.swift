//
//  File.swift
//  
//
//  Created by Enrique Perez Velasco on 14/07/2020.
//

import Foundation

extension Array where Element == Int {
    /// Returns true if the given integer is in the range between the first and las integer values of the array
    func some(value: Int?) -> Bool {
        guard let safeValue = value else { return false }
        if self.count < 2 { return false }
        return self.first! <= safeValue && safeValue <= self.last!
    }
}

extension Array where Element == [Int] {
    /// Returns true if the given integer is present in any of the ranges between the first and last integer of each array element
    func some(value: Int?) -> Bool {
        for range in self {
            if range.some(value: value) { return true }
        }
        return false
    }
}
