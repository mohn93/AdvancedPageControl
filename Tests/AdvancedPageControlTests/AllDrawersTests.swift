import XCTest
@testable import AdvancedPageControl

final class AllDrawersTests: XCTestCase {

    // MARK: - Helper

    private func allDrawers() -> [(String, AdvancedPageControlDraw)] {
        return [
            ("ColorBlendDrawer", ColorBlendDrawer()),
            ("DropDrawer", DropDrawer()),
            ("ExtendedDotDrawer", ExtendedDotDrawer()),
            ("InfiniteDrawer", InfiniteDrawer()),
            ("InfiniteScrollingDrawer", InfiniteScrollingDrawer()),
            ("JumpDrawer", JumpDrawer()),
            ("ScaleDrawer", ScaleDrawer()),
            ("ScrollingDrawer", ScrollingDrawer()),
            ("SlideDrawer", SlideDrawer()),
            ("SwapDrawer", SwapDrawer()),
            ("ThinWormDrawer", ThinWormDrawer()),
            ("ThinWormHeadsDrawer", ThinWormHeadsDrawer()),
            ("WormDrawer", WormDrawer()),
        ]
    }

    // MARK: - Protocol Conformance

    func testAllDrawersConformToProtocol() {
        for (name, drawer) in allDrawers() {
            XCTAssertNotNil(drawer.currentItem, "\(name) missing currentItem")
            XCTAssertNotNil(drawer.size, "\(name) missing size")
            XCTAssertNotNil(drawer.numberOfPages, "\(name) missing numberOfPages")
        }
    }

    // MARK: - Default Values

    func testAllDrawersHaveConsistentDefaults() {
        for (name, drawer) in allDrawers() {
            XCTAssertEqual(drawer.numberOfPages, 5, "\(name) default numberOfPages")
            XCTAssertEqual(drawer.size, 16, "\(name) default size")
            XCTAssertEqual(drawer.currentItem, 0, "\(name) default currentItem")
        }
    }

    // MARK: - Custom Initialization

    func testAllDrawersAcceptCustomValues() {
        let drawers: [(String, AdvancedPageControlDraw)] = [
            ("ColorBlendDrawer", ColorBlendDrawer(numberOfPages: 10, height: 20, width: 30, space: 8, raduis: 4)),
            ("DropDrawer", DropDrawer(numberOfPages: 10, height: 20, width: 30, space: 8, raduis: 4)),
            ("ExtendedDotDrawer", ExtendedDotDrawer(numberOfPages: 10, height: 20, width: 30, space: 8, raduis: 4)),
            ("InfiniteDrawer", InfiniteDrawer(numberOfPages: 10, height: 20, width: 30, space: 8, raduis: 4)),
            ("InfiniteScrollingDrawer", InfiniteScrollingDrawer(numberOfPages: 10, height: 20, width: 30, space: 8, raduis: 4)),
            ("JumpDrawer", JumpDrawer(numberOfPages: 10, height: 20, width: 30, space: 8, raduis: 4)),
            ("ScaleDrawer", ScaleDrawer(numberOfPages: 10, height: 20, width: 30, space: 8, raduis: 4)),
            ("ScrollingDrawer", ScrollingDrawer(numberOfPages: 10, height: 20, width: 30, space: 8, raduis: 4)),
            ("SlideDrawer", SlideDrawer(numberOfPages: 10, height: 20, width: 30, space: 8, raduis: 4)),
            ("SwapDrawer", SwapDrawer(numberOfPages: 10, height: 20, width: 30, space: 8, raduis: 4)),
            ("ThinWormDrawer", ThinWormDrawer(numberOfPages: 10, height: 20, width: 30, space: 8, raduis: 4)),
            ("ThinWormHeadsDrawer", ThinWormHeadsDrawer(numberOfPages: 10, height: 20, width: 30, space: 8, raduis: 4)),
            ("WormDrawer", WormDrawer(numberOfPages: 10, height: 20, width: 30, space: 8, raduis: 4)),
        ]
        for (name, drawer) in drawers {
            XCTAssertEqual(drawer.numberOfPages, 10, "\(name) custom numberOfPages")
            XCTAssertEqual(drawer.size, 20, "\(name) custom height->size")
        }
    }

    // MARK: - currentItem Mutation

    func testAllDrawersAllowCurrentItemMutation() {
        for (name, var drawer) in allDrawers() {
            drawer.currentItem = 3.5
            XCTAssertEqual(drawer.currentItem, 3.5, "\(name) currentItem mutation")
        }
    }

    // MARK: - Draw Does Not Crash

    func testAllDrawersDrawWithoutCrashing() {
        let rect = CGRect(x: 0, y: 0, width: 300, height: 40)
        for (name, drawer) in allDrawers() {
            drawer.draw(rect)
            XCTAssertTrue(true, "\(name) draw did not crash")
        }
    }

    func testAllDrawersDrawAtMidTransition() {
        let rect = CGRect(x: 0, y: 0, width: 300, height: 40)
        for (name, var drawer) in allDrawers() {
            drawer.currentItem = 2.5
            drawer.draw(rect)
            XCTAssertTrue(true, "\(name) draw at mid-transition did not crash")
        }
    }

    func testAllDrawersDrawAtLastPage() {
        let rect = CGRect(x: 0, y: 0, width: 300, height: 40)
        for (name, var drawer) in allDrawers() {
            drawer.currentItem = CGFloat(drawer.numberOfPages - 1)
            drawer.draw(rect)
            XCTAssertTrue(true, "\(name) draw at last page did not crash")
        }
    }

    // MARK: - Drawer-Specific Properties

    func testColorBlendDrawerScaleFactor() {
        let drawer = ColorBlendDrawer()
        XCTAssertEqual(drawer.scaleFactor, 8)
        drawer.scaleFactor = 12
        XCTAssertEqual(drawer.scaleFactor, 12)
    }

    func testScaleDrawerScaleFactor() {
        let drawer = ScaleDrawer()
        XCTAssertEqual(drawer.scaleFactor, 8)
        drawer.scaleFactor = 4
        XCTAssertEqual(drawer.scaleFactor, 4)
    }

    func testDropDrawerDropRatio() {
        let drawer = DropDrawer()
        XCTAssertEqual(drawer.dropRatio, -10)
        drawer.dropRatio = -20
        XCTAssertEqual(drawer.dropRatio, -20)
    }

    func testJumpDrawerJumpRatio() {
        let drawer = JumpDrawer()
        XCTAssertEqual(drawer.jumpRatio, 20)
        drawer.jumpRatio = 30
        XCTAssertEqual(drawer.jumpRatio, 30)
    }

    static var allTests = [
        ("testAllDrawersConformToProtocol", testAllDrawersConformToProtocol),
        ("testAllDrawersHaveConsistentDefaults", testAllDrawersHaveConsistentDefaults),
        ("testAllDrawersAcceptCustomValues", testAllDrawersAcceptCustomValues),
        ("testAllDrawersAllowCurrentItemMutation", testAllDrawersAllowCurrentItemMutation),
        ("testAllDrawersDrawWithoutCrashing", testAllDrawersDrawWithoutCrashing),
        ("testAllDrawersDrawAtMidTransition", testAllDrawersDrawAtMidTransition),
        ("testAllDrawersDrawAtLastPage", testAllDrawersDrawAtLastPage),
        ("testColorBlendDrawerScaleFactor", testColorBlendDrawerScaleFactor),
        ("testScaleDrawerScaleFactor", testScaleDrawerScaleFactor),
        ("testDropDrawerDropRatio", testDropDrawerDropRatio),
        ("testJumpDrawerJumpRatio", testJumpDrawerJumpRatio),
    ]
}
