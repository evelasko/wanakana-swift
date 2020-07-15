import XCTest
@testable import wanakana_swift

final class wanakana_swiftCharacterTests: XCTestCase {
    func test_isInUnicodeRange() {
        XCTAssertEqual(
            Character("s")
                .isInUnicodeRange(
                    start: LATIN_LOWERCASE_START,
                    end: LATIN_LOWERCASE_END),
           true
        )
        XCTAssertEqual(
            Character("S")
                .isInUnicodeRange(
                    start: LATIN_LOWERCASE_START,
                    end: LATIN_LOWERCASE_END),
           false
        )
    
    }
    
    func test_JapaneseChecks() {
        let ch = UnicodeScalar(0x30A1)!
        
        print(String(ch))
        
        let alphanumeric = "1234567qwertyuiop@:[];.,/_"
        let hasKanji = "時は金成り"
        let hasKatakana = "アバタモエクボ"
        let hasHiragana = "ともだち"
        let hasHalfWidth = "ｲ ｳ ｴ "
        let hasPunctuation = "「 」"
        let radicals = "⻆⺋⺠⺡⺢⺣⺤⺥"
        let kanji = "漢字日本語文字言語言葉"
        
        //MARK: - StringExtensions
        
        /// Has Kanji?
        XCTAssertFalse(alphanumeric.hasKanji)
        XCTAssertFalse(hasKatakana.hasKanji)
        XCTAssertFalse(hasHiragana.hasKanji)
        XCTAssertTrue(hasKanji.hasKanji)
        
        /// Has Hiragana?
        XCTAssertFalse(alphanumeric.hasHiragana)
        XCTAssertFalse(hasKatakana.hasHiragana)
        XCTAssertTrue(hasKanji.hasHiragana)
        XCTAssertTrue(hasHiragana.hasHiragana)
        
        /// Has Katakana?
        XCTAssertFalse(alphanumeric.hasKatakana)
        XCTAssertFalse(hasHiragana.hasKatakana)
        XCTAssertFalse(hasKanji.hasKatakana)
        XCTAssertTrue(hasKatakana.hasKatakana)
        
        /// Has Halwidth or Punctuation
        XCTAssertTrue(hasHalfWidth.hasHalfWidthOrPunctuation)
        XCTAssertTrue(hasPunctuation.hasHalfWidthOrPunctuation)
        XCTAssertFalse(alphanumeric.hasHalfWidthOrPunctuation)
        
        /// Has Japanese characters
        XCTAssertFalse(alphanumeric.hasJapanese)
        XCTAssertTrue(hasKanji.hasJapanese)
        XCTAssertTrue(hasKatakana.hasJapanese)
        XCTAssertTrue(hasHiragana.hasJapanese)
        XCTAssertFalse(hasPunctuation.hasJapanese)
        XCTAssertTrue(hasHalfWidth.hasJapanese)
        
        //MARK: - Character Extensions
        
        for char in alphanumeric {
            XCTAssertFalse(char.isHiragana)
            XCTAssertFalse(char.isKanji)
            XCTAssertFalse(char.isKatakana)
            XCTAssertFalse(char.isKanjiRadical)
        }
        for char in hasKatakana {
            XCTAssertTrue(char.isKatakana)
            XCTAssertFalse(char.isHiragana)
            XCTAssertFalse(char.isKanji)
            XCTAssertFalse(char.isKanjiRadical)
        }
        for char in hasHiragana {
            XCTAssertTrue(char.isHiragana)
            XCTAssertFalse(char.isKatakana)
            XCTAssertFalse(char.isKanji)
            XCTAssertFalse(char.isKanjiRadical)
        }
        for char in radicals {
            XCTAssertTrue(char.isKanjiRadical)
            XCTAssertFalse(char.isHiragana)
            XCTAssertFalse(char.isKatakana)
        }
        for char in kanji {
            XCTAssertTrue(char.isKanji)
            XCTAssertFalse(char.isHiragana)
            XCTAssertFalse(char.isKatakana)
            XCTAssertFalse(char.isKanjiRadical)
        }
    }

    static var allTests = [
        ("test_isInUnicodeRange", test_isInUnicodeRange),
    ]
}
