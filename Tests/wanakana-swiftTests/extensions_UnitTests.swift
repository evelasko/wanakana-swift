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
    
    func test_replaceRegexusingCallback() {
        let pattern = try! NSRegularExpression(pattern: #"\d{2}"#, options: [])
        let success = "success23"
        let fail = "no pattern match"
        let successResult = success.replace(regex: pattern)
            { match in String(Int(match)! + 7) }
        let failResult = fail.replace(regex: pattern)
            { match in String(Int(match)! + 7) }
        XCTAssertEqual(successResult, "success30")
        XCTAssertEqual(failResult, fail)
    }

    func test_firstCharCode() {
        let string = "string"
        let empty = ""
        XCTAssertGreaterThan(string.firstCharCode, 0)
        XCTAssertEqual(empty.firstCharCode, 0)
    }
    
    func testDictionaryMerge() {
        let original = ["a": 1, "b": 2]
        let merged = original.merge(["a": 5, "c": 100])
        XCTAssertEqual(merged["a"], 5)
        XCTAssertEqual(merged["c"], 100)
    }
    
    func testStringSlice() {
        let full = "complete string"
        let sliced = full.slice(0, 8)
        XCTAssertEqual(sliced, "complete")
        let lastWord = full.slice(9)
        XCTAssertEqual(lastWord, "string")
    }

    static var allTests = [
        ("test_isInUnicodeRange", test_isInUnicodeRange),
        ("testDictionaryMerge", testDictionaryMerge),
        ("testStringSlice", testStringSlice)
    ]
}
