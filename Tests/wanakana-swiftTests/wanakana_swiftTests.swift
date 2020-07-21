import XCTest
@testable import wanakana_swift

final class wanakana_swiftTests: XCTestCase {
    
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
    
    //MARK: - Conversion Tests
    
    func test_KatakanaToHiraganaConversion() {
        let inHiragana = "カタガナㇳ".inHiragana
        XCTAssertNotNil(inHiragana)
        XCTAssertTrue(inHiragana.hasHiragana)
        let noKana = "string without kana"
        XCTAssertEqual(noKana, noKana.inHiragana)
    }
    
    func testHiraganaToKatakanaConversion() {
        let inKatakana = "とともよ".inKatakana
        XCTAssertNotNil(inKatakana)
        XCTAssertTrue(inKatakana.hasKatakana)
        let noKana = "string without kana"
        XCTAssertEqual(noKana, noKana.inKatakana)
    }
    
//    func testRomajiConversion() {
//        let inHiragana = "したところでうまのみみにねんぶつ"
//        let inKatakana = inHiragana.inKatakana
//
//        let hiraganaRomaji = inHiragana.inRomaji
//        let katakanaRomaji = inKatakana.inRomaji
//
//        XCTAssertNotNil(hiraganaRomaji)
//        XCTAssertNotNil(katakanaRomaji)
//        XCTAssertFalse(hiraganaRomaji.isEmpty)
//        XCTAssertFalse(katakanaRomaji.isEmpty)
//        XCTAssertFalse(hiraganaRomaji.hasKana)
//        XCTAssertFalse(katakanaRomaji.hasKana)
//    }
    
    func testKanaTokenization() {
        let test1 = "したとソスでうまのみみにねんぶつ"
        let test2 = "くちみキェそちよおちゃ"
        let test3 = "けきしいおふあふぬぢぇ"
        
        let result1 = test1.tokenizedKana
        let result2 = test2.tokenizedKana
        let result3 = test3.tokenizedKana
        
        print(result1)
        print(result2)
        print(result3)
        
        XCTAssertNotNil(result1)
        XCTAssertNotNil(result2)
        XCTAssertNotNil(result3)
        
    }
    
    func testTokenization() {
        let test1 = "したとソスでうまのみみにねんぶつ"
        let test2 = "くちみキェそちよおちゃ"
        let test3 = "けきしいおふあふぬぢぇ"
        
        let result1 = test1.tokenizedAll
        let result2 = test2.tokenizedAll
        let result3 = test3.tokenizedAll
        
        print(result1)
        print(result2)
        print(result3)
        
        XCTAssertNotNil(result1)
        XCTAssertNotNil(result2)
        XCTAssertNotNil(result3)
        
        XCTAssertGreaterThan(result1.count, 0)
        XCTAssertGreaterThan(result2.count, 0)
        XCTAssertGreaterThan(result3.count, 0)
    }

    static var allTests = [
        ("test_JapaneseChecks", test_JapaneseChecks),
        ("test_KatakanaToHiraganaConversion", test_KatakanaToHiraganaConversion),
        ("testHiraganaToKatakanaConversion", testHiraganaToKatakanaConversion)
    ]
}
