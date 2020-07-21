//
//  File.swift
//  
//
//  Created by Enrique Perez Velasco on 14/07/2020.
//

import Foundation

extension String {
    /// Check if string contains hiragana characters
    var hasHiragana: Bool {
        self.range(
            of: #"\p{Hiragana}"#,
            options: .regularExpression) != nil
    }
    /// Check if string contains katakana characters
    var hasKatakana: Bool {
        self.range(
            of: #"\p{Katakana}"#,
            options: .regularExpression) != nil
    }
    /// Check if string contains kanji characters
    var hasKanji: Bool {
        self.range(
            of: #"\p{Han}"#,
            options: .regularExpression) != nil
    }
    /// Check if string contains half width or punctuation characters
    var hasHalfWidthOrPunctuation: Bool {
        self.range(
            of: #"[\x{FF5F}-\x{FF9F}]|[\x{3000}-\x{303F}]"#,
            options: .regularExpression) != nil
    }
    /// Check if string contains kana characters
    var hasKana: Bool {
        self.hasHiragana || self.hasKatakana
    }
    /// Check if string contains kana or kanji characters
    var hasJapanese: Bool {
        self.hasKana || self.hasKanji
    }
}
