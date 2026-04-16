import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(DrawerParentTests.allTests),
        testCase(DrawerParentWithIndicatorTests.allTests),
        testCase(ColorUtilsTests.allTests),
        testCase(AllDrawersTests.allTests),
        testCase(ExtendedDotDrawerTests.allTests),
        testCase(AdvancedPageControlViewTests.allTests),
    ]
}
#endif
