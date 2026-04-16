import XCTest
@testable import AdvancedPageControlTests

XCTMain([
    testCase(DrawerParentTests.allTests),
    testCase(DrawerParentWithIndicatorTests.allTests),
    testCase(ColorUtilsTests.allTests),
    testCase(AllDrawersTests.allTests),
    testCase(ExtendedDotDrawerTests.allTests),
    testCase(AdvancedPageControlViewTests.allTests),
    testCase(DrawerParentAlignmentTests.allTests),
])
