//
//  File.swift
//  
//
//  Created by Enrique Perez Velasco on 20/07/2020.
//

import Foundation

public extension String {
    
    /// Returns the full range of the String as NSRange
    var fullRange: NSRange { NSRange(location: 0, length: self.count)}
    
    /// Returns the string replacign all regex matches with the return value of the function
    func replace(regex: NSRegularExpression, function: (_ found: String) -> String) -> String {
        var result = self as NSString
        let matches = regex.matches(
            in: self, options: [],
            range: self.fullRange
        )
        if matches.isEmpty { return self }
        matches.forEach { match in
            let range = Range(match.range, in: self)!
            result = result.replacingCharacters(
                in: match.range,
                with: function(String(self[range]))
            ) as NSString
        }
        return result as String
    }
    
    /// Returns the Unicode code unit of the first character or 0 if empty
    var firstCharCode: Int {
        self.isEmpty
            ? 0
            : charCodeAt(index: 0)
    }
    
    //MARK: - Javascript Like Extensions
    
    func slice(_ from: Int, _ to: Int = -1) -> String {
        var start = from
        var end = to == -1 ? self.count - 1 : to
            if start < 0 { start = 0 }
            if end < 0 { end = 0 }
            if start > end {
                let _start = start
                start = end
                end = _start
            }
            end = end - start
        return (self as NSString).substring(with: NSMakeRange(start, end))
        }
    
    func charAt(index: Int) -> String {
        String(Array(self)[index])
    }
    
    func charCodeAt(index: Int) -> Int {
        Int((self as NSString).character(at: index))
    }

}

/// Returns the character from the given integer code as String
func fromCharCode(_ code: Int) -> String {
    String(UnicodeScalar(code)!)
}
