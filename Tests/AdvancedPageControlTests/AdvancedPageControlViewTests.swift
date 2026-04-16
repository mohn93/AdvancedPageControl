import XCTest
@testable import AdvancedPageControl

final class AdvancedPageControlViewTests: XCTestCase {

    // MARK: - Initialization

    func testDefaultInit() {
        let view = AdvancedPageControlView(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        XCTAssertEqual(view.backgroundColor, UIColor.clear)
    }

    func testDefaultDrawerIsInfiniteScrolling() {
        let view = AdvancedPageControlView(frame: .zero)
        XCTAssertTrue(view.drawer is InfiniteScrollingDrawer)
    }

    // MARK: - numberOfPages

    func testNumberOfPagesSyncsWithDrawer() {
        let view = AdvancedPageControlView(frame: .zero)
        view.numberOfPages = 10
        XCTAssertEqual(view.numberOfPages, 10)
        XCTAssertEqual(view.drawer.numberOfPages, 10)
    }

    func testNumberOfPagesDefaultValue() {
        let view = AdvancedPageControlView(frame: .zero)
        XCTAssertEqual(view.numberOfPages, 5)
    }

    // MARK: - setPageOffset

    func testSetPageOffsetUpdatesDrawerCurrentItem() {
        let view = AdvancedPageControlView(frame: .zero)
        view.setPageOffset(3.5)
        XCTAssertEqual(view.drawer.currentItem, 3.5)
    }

    func testSetPageOffsetToZero() {
        let view = AdvancedPageControlView(frame: .zero)
        view.setPageOffset(2.0)
        view.setPageOffset(0.0)
        XCTAssertEqual(view.drawer.currentItem, 0.0)
    }

    // MARK: - Custom Drawer Assignment

    func testAssignCustomDrawer() {
        let view = AdvancedPageControlView(frame: .zero)
        let wormDrawer = WormDrawer(numberOfPages: 8)
        view.drawer = wormDrawer
        XCTAssertEqual(view.numberOfPages, 8)
        XCTAssertTrue(view.drawer is WormDrawer)
    }

    func testAssignExtendedDotDrawerWithCustomWidthRadius() {
        let view = AdvancedPageControlView(frame: .zero)
        let drawer = ExtendedDotDrawer(width: 24, raduis: 12)
        view.drawer = drawer
        let assignedDrawer = view.drawer as! ExtendedDotDrawer
        XCTAssertEqual(assignedDrawer.width, 24)
        XCTAssertEqual(assignedDrawer.radius, 12)
    }

    // MARK: - intrinsicContentSize

    func testIntrinsicContentSizeUsesDrawerSize() {
        let view = AdvancedPageControlView(frame: .zero)
        let intrinsic = view.intrinsicContentSize
        XCTAssertEqual(intrinsic.width, 16)
        XCTAssertEqual(intrinsic.height, 32)
    }

    // MARK: - Draw Delegation

    func testDrawDelegatesToDrawer() {
        let view = AdvancedPageControlView(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
        view.drawer = SlideDrawer(numberOfPages: 3)
        view.setPageOffset(1.0)
        view.draw(view.bounds)
    }

    static var allTests = [
        ("testDefaultInit", testDefaultInit),
        ("testDefaultDrawerIsInfiniteScrolling", testDefaultDrawerIsInfiniteScrolling),
        ("testNumberOfPagesSyncsWithDrawer", testNumberOfPagesSyncsWithDrawer),
        ("testNumberOfPagesDefaultValue", testNumberOfPagesDefaultValue),
        ("testSetPageOffsetUpdatesDrawerCurrentItem", testSetPageOffsetUpdatesDrawerCurrentItem),
        ("testSetPageOffsetToZero", testSetPageOffsetToZero),
        ("testAssignCustomDrawer", testAssignCustomDrawer),
        ("testAssignExtendedDotDrawerWithCustomWidthRadius", testAssignExtendedDotDrawerWithCustomWidthRadius),
        ("testIntrinsicContentSizeUsesDrawerSize", testIntrinsicContentSizeUsesDrawerSize),
        ("testDrawDelegatesToDrawer", testDrawDelegatesToDrawer),
    ]
}
