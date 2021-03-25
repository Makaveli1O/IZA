import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
    testCase(proj1Tests.allTests),
    testCase(FiniteAutomataTests.allTests),
    ]
}
#endif
