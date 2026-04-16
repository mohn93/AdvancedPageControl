import XCTest
@testable import AdvancedPageControl

final class DrawerParentWithIndicatorTests: XCTestCase {

    // MARK: - Default Initialization

    func testDefaultInitValues() {
        let drawer = AdvancedPageControlDrawerParentWithIndicator()
        XCTAssertEqual(drawer.numberOfPages, 5)
        XCTAssertEqual(drawer.size, 16)
        XCTAssertEqual(drawer.width, 16)
        XCTAssertEqual(drawer.space, 16)
        XCTAssertEqual(drawer.radius, 8)
        XCTAssertEqual(drawer.currentItem, 0)
        XCTAssertEqual(drawer.dotsColor, UIColor.lightGray)
        XCTAssertEqual(drawer.indicatorColor, UIColor.white)
        XCTAssertEqual(drawer.indicatorBorderColor, UIColor.white)
        XCTAssertEqual(drawer.indicatorBorderWidth, 2)
    }

    // MARK: - Custom Initialization

    func testCustomInitValues() {
        let drawer = AdvancedPageControlDrawerParentWithIndicator(
            numberOfPages: 7,
            height: 12,
            width: 24,
            space: 6,
            raduis: 3,
            currentItem: 2,
            indicatorColor: .red,
            dotsColor: .blue,
            isBordered: true,
            borderColor: .green,
            borderWidth: 2,
            indicatorBorderColor: .yellow,
            indicatorBorderWidth: 4
        )
        XCTAssertEqual(drawer.numberOfPages, 7)
        XCTAssertEqual(drawer.size, 12)
        XCTAssertEqual(drawer.width, 24)
        XCTAssertEqual(drawer.space, 6)
        XCTAssertEqual(drawer.radius, 3)
        XCTAssertEqual(drawer.currentItem, 2)
        XCTAssertEqual(drawer.indicatorColor, UIColor.red)
        XCTAssertEqual(drawer.dotsColor, UIColor.blue)
        XCTAssertEqual(drawer.isBordered, true)
        XCTAssertEqual(drawer.borderColor, UIColor.green)
        XCTAssertEqual(drawer.borderWidth, 2)
        XCTAssertEqual(drawer.indicatorBorderColor, UIColor.yellow)
        XCTAssertEqual(drawer.indicatorBorderWidth, 4)
    }

    // MARK: - Property Mutation

    func testIndicatorPropertiesAreMutableAfterInit() {
        let drawer = AdvancedPageControlDrawerParentWithIndicator()
        drawer.indicatorColor = .orange
        drawer.indicatorBorderColor = .purple
        drawer.indicatorBorderWidth = 5

        XCTAssertEqual(drawer.indicatorColor, UIColor.orange)
        XCTAssertEqual(drawer.indicatorBorderColor, UIColor.purple)
        XCTAssertEqual(drawer.indicatorBorderWidth, 5)
    }

    static var allTests = [
        ("testDefaultInitValues", testDefaultInitValues),
        ("testCustomInitValues", testCustomInitValues),
        ("testIndicatorPropertiesAreMutableAfterInit", testIndicatorPropertiesAreMutableAfterInit),
    ]
}
