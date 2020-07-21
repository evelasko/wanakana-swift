//
//  File.swift
//  
//
//  Created by Enrique Perez Velasco on 14/07/2020.
//

import Foundation

// CharCode References
// http://www.rikai.com/library/kanjitables/kanji_codes.unicode.shtml
// http://unicode-table.com

public let LATIN_LOWERCASE_START = 0x61
public let LATIN_LOWERCASE_END = 0x7a
public let LATIN_UPPERCASE_START = 0x41
public let LATIN_UPPERCASE_END = 0x5a
public let LOWERCASE_ZENKAKU_START = 0xff41
public let LOWERCASE_ZENKAKU_END = 0xff5a
public let UPPERCASE_ZENKAKU_START = 0xff21
public let UPPERCASE_ZENKAKU_END = 0xff3a
public let HIRAGANA_START = 0x3041
public let HIRAGANA_END = 0x3096
public let KATAKANA_START = 0x30a1
public let KATAKANA_END = 0x30fc
public let KANJI_START = 0x4e00
public let KANJI_END = 0x9faf
public let PROLONGED_SOUND_MARK = 0x30fc
public let KANA_SLASH_DOT = 0x30fb

private let ZENKAKU_NUMBERS = [0xff10, 0xff19]
private let ZENKAKU_UPPERCASE = [UPPERCASE_ZENKAKU_START, UPPERCASE_ZENKAKU_END]
private let ZENKAKU_LOWERCASE = [LOWERCASE_ZENKAKU_START, LOWERCASE_ZENKAKU_END]
private let ZENKAKU_PUNCTUATION_1 = [0xff01, 0xff0f]
private let ZENKAKU_PUNCTUATION_2 = [0xff1a, 0xff1f]
private let ZENKAKU_PUNCTUATION_3 = [0xff3b, 0xff3f]
private let ZENKAKU_PUNCTUATION_4 = [0xff5b, 0xff60]
private let ZENKAKU_SYMBOLS_CURRENCY = [0xffe0, 0xffee]

private let HIRAGANA_CHARS = [0x3040, 0x309f]
private let KATAKANA_CHARS = [0x30a0, 0x30ff]
private let HANKAKU_KATAKANA = [0xff66, 0xff9f]
private let KATAKANA_PUNCTUATION = [0x30fb, 0x30fc]
private let KANA_PUNCTUATION = [0xff61, 0xff65]
private let CJK_SYMBOLS_PUNCTUATION = [0x3000, 0x303f]
private let COMMON_CJK = [0x4e00, 0x9fff]
private let RARE_CJK = [0x3400, 0x4dbf]

public let KANA_RANGES = [HIRAGANA_CHARS, KATAKANA_CHARS, KANA_PUNCTUATION, HANKAKU_KATAKANA]

public let JA_PUNCTUATION_RANGES = [
    CJK_SYMBOLS_PUNCTUATION,
    KANA_PUNCTUATION,
    KATAKANA_PUNCTUATION,
    ZENKAKU_PUNCTUATION_1,
    ZENKAKU_PUNCTUATION_2,
    ZENKAKU_PUNCTUATION_3,
    ZENKAKU_PUNCTUATION_4,
    ZENKAKU_SYMBOLS_CURRENCY,
]

// All Japanese unicode start and end ranges
// Includes kanji, kana, zenkaku latin chars, punctuation, and number ranges.
public let JAPANESE_RANGES = [
    HIRAGANA_CHARS, KATAKANA_CHARS, KANA_PUNCTUATION, HANKAKU_KATAKANA,
    CJK_SYMBOLS_PUNCTUATION,
    KANA_PUNCTUATION,
    KATAKANA_PUNCTUATION,
    ZENKAKU_PUNCTUATION_1,
    ZENKAKU_PUNCTUATION_2,
    ZENKAKU_PUNCTUATION_3,
    ZENKAKU_PUNCTUATION_4,
    ZENKAKU_SYMBOLS_CURRENCY,
    ZENKAKU_UPPERCASE,
    ZENKAKU_LOWERCASE,
    ZENKAKU_NUMBERS,
    COMMON_CJK,
    RARE_CJK,
]

private let MODERN_ENGLISH = [0x0000, 0x007f]
private let HEPBURN_MACRON_RANGES = [
    [0x0100, 0x0101], // Ā ā
    [0x0112, 0x0113], // Ē ē
    [0x012a, 0x012b], // Ī ī
    [0x014c, 0x014d], // Ō ō
    [0x016a, 0x016b], // Ū ū
]
private let SMART_QUOTE_RANGES = [
    [0x2018, 0x2019], // ‘ ’
    [0x201c, 0x201d], // “ ”
]

public let ROMAJI_RANGES: [[Int]] = [
    MODERN_ENGLISH,
    [0x0100, 0x0101], // Ā ā
    [0x0112, 0x0113], // Ē ē
    [0x012a, 0x012b], // Ī ī
    [0x014c, 0x014d], // Ō ō
    [0x016a, 0x016b], // Ū ū
]

public let EN_PUNCTUATION_RANGES = [
    [0x20, 0x2f],
    [0x3a, 0x3f],
    [0x5b, 0x60],
    [0x7b, 0x7e],
    [0x2018, 0x2019], // ‘ ’
    [0x201c, 0x201d]
]
