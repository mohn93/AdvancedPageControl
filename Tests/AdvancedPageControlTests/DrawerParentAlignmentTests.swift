import XCTest
@testable import AdvancedPageControl

final class DrawerParentAlignmentTests: XCTestCase {

    func testDefaultAlignmentIsCenter() {
        let parent = AdvancedPageControlDrawerParent()
        XCTAssertEqual(parent.alignment, .center)
    }

    func testLeftAlignmentFirstDotStartsAtZero() {
        let parent = AdvancedPageControlDrawerParent()
        parent.alignment = .left
        let rect = CGRect(x: 0, y: 0, width: 200, height: 40)
        let x = parent.getCenteredXPosition(rect, itemPos: 0, dotSize: 10, space: 5, numberOfPages: 3)
        XCTAssertEqual(x, 0, accuracy: 0.001)
    }

    func testLeftAlignmentDotsAreEvenlySpaced() {
        let parent = AdvancedPageControlDrawerParent()
        parent.alignment = .left
        let rect = CGRect(x: 0, y: 0, width: 200, height: 40)
        let x0 = parent.getCenteredXPosition(rect, itemPos: 0, dotSize: 10, space: 5, numberOfPages: 3)
        let x1 = parent.getCenteredXPosition(rect, itemPos: 1, dotSize: 10, space: 5, numberOfPages: 3)
        let x2 = parent.getCenteredXPosition(rect, itemPos: 2, dotSize: 10, space: 5, numberOfPages: 3)
        XCTAssertEqual(x1 - x0, 15, accuracy: 0.001)
        XCTAssertEqual(x2 - x1, 15, accuracy: 0.001)
    }

    func testRightAlignmentLastDotEndsAtRectWidth() {
        let parent = AdvancedPageControlDrawerParent()
        parent.alignment = .right
        let rect = CGRect(x: 0, y: 0, width: 200, height: 40)
        let x = parent.getCenteredXPosition(rect, itemPos: 2, dotSize: 10, space: 5, numberOfPages: 3)
        XCTAssertEqual(x + 10, rect.width, accuracy: 0.001)
    }

    func testRightAlignmentDotsAreEvenlySpaced() {
        let parent = AdvancedPageControlDrawerParent()
        parent.alignment = .right
        let rect = CGRect(x: 0, y: 0, width: 200, height: 40)
        let x0 = parent.getCenteredXPosition(rect, itemPos: 0, dotSize: 10, space: 5, numberOfPages: 3)
        let x1 = parent.getCenteredXPosition(rect, itemPos: 1, dotSize: 10, space: 5, numberOfPages: 3)
        let x2 = parent.getCenteredXPosition(rect, itemPos: 2, dotSize: 10, space: 5, numberOfPages: 3)
        XCTAssertEqual(x1 - x0, 15, accuracy: 0.001)
        XCTAssertEqual(x2 - x1, 15, accuracy: 0.001)
    }

    func testCenterAlignmentMatchesOriginalFormula() {
        let parent = AdvancedPageControlDrawerParent()
        parent.alignment = .center
        let rect = CGRect(x: 0, y: 0, width: 200, height: 40)
        let x = parent.getCenteredXPosition(rect, itemPos: 0, dotSize: 10, space: 5, numberOfPages: 3)
        XCTAssertEqual(x, 79, accuracy: 0.001)
    }

    func testAlignmentIsMutableAfterInit() {
        let parent = AdvancedPageControlDrawerParent()
        parent.alignment = .left
        XCTAssertEqual(parent.alignment, .left)
        parent.alignment = .right
        XCTAssertEqual(parent.alignment, .right)
        parent.alignment = .center
        XCTAssertEqual(parent.alignment, .center)
    }

    static var allTests = [
        ("testDefaultAlignmentIsCenter", testDefaultAlignmentIsCenter),
        ("testLeftAlignmentFirstDotStartsAtZero", testLeftAlignmentFirstDotStartsAtZero),
        ("testLeftAlignmentDotsAreEvenlySpaced", testLeftAlignmentDotsAreEvenlySpaced),
        ("testRightAlignmentLastDotEndsAtRectWidth", testRightAlignmentLastDotEndsAtRectWidth),
        ("testRightAlignmentDotsAreEvenlySpaced", testRightAlignmentDotsAreEvenlySpaced),
        ("testCenterAlignmentMatchesOriginalFormula", testCenterAlignmentMatchesOriginalFormula),
        ("testAlignmentIsMutableAfterInit", testAlignmentIsMutableAfterInit),
    ]
}
