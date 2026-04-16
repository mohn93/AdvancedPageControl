import XCTest
@testable import AdvancedPageControl

final class ExtendedDotDrawerTests: XCTestCase {

    // MARK: - Issue #19: Width and Radius Must Be Settable

    func testWidthIsSettableAfterInit() {
        let drawer = ExtendedDotDrawer()
        XCTAssertEqual(drawer.width, 16)
        drawer.width = 24
        XCTAssertEqual(drawer.width, 24)
    }

    func testRadiusIsSettableAfterInit() {
        let drawer = ExtendedDotDrawer()
        XCTAssertEqual(drawer.radius, 8)
        drawer.radius = 12
        XCTAssertEqual(drawer.radius, 12)
    }

    func testCustomWidthViaInit() {
        let drawer = ExtendedDotDrawer(width: 32)
        XCTAssertEqual(drawer.width, 32)
    }

    func testCustomRadiusViaInit() {
        let drawer = ExtendedDotDrawer(raduis: 4)
        XCTAssertEqual(drawer.radius, 4)
    }

    func testCustomWidthAndRadiusTogether() {
        let drawer = ExtendedDotDrawer(width: 20, raduis: 10)
        XCTAssertEqual(drawer.width, 20)
        XCTAssertEqual(drawer.radius, 10)
    }

    // MARK: - Draw With Custom Values Does Not Crash

    func testDrawWithCustomWidthAndRadius() {
        let drawer = ExtendedDotDrawer(
            numberOfPages: 5, height: 12, width: 24, space: 8, raduis: 6,
            indicatorColor: .red, dotsColor: .gray
        )
        let rect = CGRect(x: 0, y: 0, width: 300, height: 40)
        drawer.draw(rect)
    }

    func testDrawAfterMutatingWidthAndRadius() {
        let drawer = ExtendedDotDrawer()
        drawer.width = 30
        drawer.radius = 15
        let rect = CGRect(x: 0, y: 0, width: 300, height: 40)
        drawer.draw(rect)
        XCTAssertEqual(drawer.width, 30)
        XCTAssertEqual(drawer.radius, 15)
    }

    // MARK: - Page Transitions

    func testDrawDuringPageTransition() {
        let drawer = ExtendedDotDrawer(numberOfPages: 5, width: 20, raduis: 10)
        let rect = CGRect(x: 0, y: 0, width: 300, height: 40)
        for progress in stride(from: 0.0, through: 1.0, by: 0.1) {
            drawer.currentItem = CGFloat(progress)
            drawer.draw(rect)
        }
    }

    func testDrawAtBoundaryPages() {
        let drawer = ExtendedDotDrawer(numberOfPages: 3, width: 20, raduis: 10)
        let rect = CGRect(x: 0, y: 0, width: 300, height: 40)
        drawer.currentItem = 0
        drawer.draw(rect)
        drawer.currentItem = 2
        drawer.draw(rect)
    }

    // MARK: - Space Property

    func testSpaceIsSettableAfterInit() {
        let drawer = ExtendedDotDrawer()
        XCTAssertEqual(drawer.space, 16)
        drawer.space = 10
        XCTAssertEqual(drawer.space, 10)
    }

    static var allTests = [
        ("testWidthIsSettableAfterInit", testWidthIsSettableAfterInit),
        ("testRadiusIsSettableAfterInit", testRadiusIsSettableAfterInit),
        ("testCustomWidthViaInit", testCustomWidthViaInit),
        ("testCustomRadiusViaInit", testCustomRadiusViaInit),
        ("testCustomWidthAndRadiusTogether", testCustomWidthAndRadiusTogether),
        ("testDrawWithCustomWidthAndRadius", testDrawWithCustomWidthAndRadius),
        ("testDrawAfterMutatingWidthAndRadius", testDrawAfterMutatingWidthAndRadius),
        ("testDrawDuringPageTransition", testDrawDuringPageTransition),
        ("testDrawAtBoundaryPages", testDrawAtBoundaryPages),
        ("testSpaceIsSettableAfterInit", testSpaceIsSettableAfterInit),
    ]
}
