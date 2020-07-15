//
//  File.swift
//  
//
//  Created by Enrique Perez Velasco on 14/07/2020.
//

import Foundation

public extension Character {
    //MARK: - Helpers
    /// Returns the integer representation of the first code unit of the character if available
    var utf16int: Int? {
        guard let codeUnit = self.utf16.first else { return nil }
        return Int(codeUnit)
    }
    
    /// Check if character is in unicode range
    /// - Parameter from: Starting unicode integer value (0x61)
    /// - Parameter to: End unicode integer value (0x7a)
    /// - Returns: true if character is in range or false i not
    func isInUnicodeRange(start: Int, end: Int) -> Bool {
        guard let safeCode = self.utf16int else { return false }
        return [start, end].some(value: safeCode)
    }
    /// Check if character is in unicode range
    /// - Parameter range: An array containing at least two integer values e.g.:[0x3040, 0x309f]
    /// - Returns: true if character is in range between first and last integer of the array
    func isInUnicodeRange(range: [Int]) -> Bool {
        range.some(value: self.utf16int)
    }
    
    /// Returns true if char is 'ー'
    var isLongDash: Bool {
        guard let code = self.utf16int else { return false }
        return code == PROLONGED_SOUND_MARK
    }
    
    
    //MARK: - Japanese Checks
    /// Check if character is hiragana
    var isHiragana: Bool {
        self.isLongDash ||
        self.isInUnicodeRange( start: HIRAGANA_START, end: HIRAGANA_END)
    }
    /// Check if the character is katakana
    var isKatakana: Bool {
        self.isInUnicodeRange(start: KATAKANA_START, end: KATAKANA_END)
    }
    /// Check if the character is  a kana
    var isKana: Bool {
        self.isHiragana || self.isKatakana
    }
    /// Check if the character is kanji
    var isKanji: Bool {
        self.isInUnicodeRange(start: KANJI_START, end: KANJI_END)
    }
    /// Check if the character is either kanji or a kana
    var isJapanese: Bool {
        JAPANESE_RANGES.some(value: self.utf16int)
    }
    /// Check if the character is a half width or a japanese punctuation
    var isJapanesePunctuation: Bool {
        String(self).hasHalfWidthOrPunctuation
    }
    /// Check if is a kanji radical
    var isKanjiRadical: Bool {
        String(self).range(
            of: #"[\x{2E80}-\x{2FD5}]"#,
            options: .regularExpression) != nil
    }
    /// Returns true if the character is Romaji
    var isRomaji: Bool {
        ROMAJI_RANGES.some(value: self.utf16int)
    }
    /// Tests if char is '・'
    var isCharSlashDot: Bool {
        guard let code = self.utf16int else { return false }
        return code == KANA_SLASH_DOT
    }
}
