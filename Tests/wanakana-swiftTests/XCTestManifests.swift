import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(wanakana_swiftTests.allTests),
    ]
}
#endif
