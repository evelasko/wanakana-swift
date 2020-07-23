//
//  File.swift
//  
//
//  Created by Enrique Perez Velasco on 22/07/2020.
//

import Foundation

public struct Tokenized: Hashable {
    public let hiragana: String
    public let katakana: String
    public let romaji: String
    
    public init(hiragana: String, katakana: String, romaji: String) {
        self.hiragana = hiragana
        self.katakana = katakana
        self.romaji = romaji
    }
}
