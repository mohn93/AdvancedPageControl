import XCTest
@testable import AdvancedPageControl

final class AdvancedPageControlViewAlignmentTests: XCTestCase {

    func testDefaultAlignmentIsCenter() {
        let view = AdvancedPageControlView(frame: .zero)
        XCTAssertEqual(view.alignment, .center)
    }

    func testSettingAlignmentSyncsToDrawer() throws {
        let view = AdvancedPageControlView(frame: .zero)
        view.drawer = SlideDrawer()
        view.alignment = .left
        let drawer = try XCTUnwrap(view.drawer as? AdvancedPageControlDrawerParent)
        XCTAssertEqual(drawer.alignment, .left)
    }

    func testSettingAlignmentToRightSyncsToDrawer() throws {
        let view = AdvancedPageControlView(frame: .zero)
        view.drawer = WormDrawer()
        view.alignment = .right
        let drawer = try XCTUnwrap(view.drawer as? AdvancedPageControlDrawerParent)
        XCTAssertEqual(drawer.alignment, .right)
    }

    func testSettingAlignmentToCenterSyncsToDrawer() throws {
        let view = AdvancedPageControlView(frame: .zero)
        view.drawer = ExtendedDotDrawer()
        view.alignment = .center
        let drawer = try XCTUnwrap(view.drawer as? AdvancedPageControlDrawerParent)
        XCTAssertEqual(drawer.alignment, .center)
    }

    func testNewDrawerInheritsCurrentAlignment() throws {
        let view = AdvancedPageControlView(frame: .zero)
        view.alignment = .left
        view.drawer = ScaleDrawer()
        let drawer = try XCTUnwrap(view.drawer as? AdvancedPageControlDrawerParent)
        XCTAssertEqual(drawer.alignment, .left)
    }

    func testNewDrawerInheritsRightAlignment() throws {
        let view = AdvancedPageControlView(frame: .zero)
        view.alignment = .right
        view.drawer = JumpDrawer()
        let drawer = try XCTUnwrap(view.drawer as? AdvancedPageControlDrawerParent)
        XCTAssertEqual(drawer.alignment, .right)
    }

    func testDrawWithLeftAlignmentDoesNotCrash() {
        let view = AdvancedPageControlView(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
        view.drawer = SlideDrawer(numberOfPages: 5)
        view.alignment = .left
        view.draw(view.bounds)
    }

    func testDrawWithRightAlignmentDoesNotCrash() {
        let view = AdvancedPageControlView(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
        view.drawer = WormDrawer(numberOfPages: 5)
        view.alignment = .right
        view.draw(view.bounds)
    }

    func testAllDrawersDrawWithLeftAlignment() {
        let drawers: [AdvancedPageControlDraw] = [
            ColorBlendDrawer(), DropDrawer(), ExtendedDotDrawer(),
            InfiniteDrawer(), InfiniteScrollingDrawer(), JumpDrawer(),
            ScaleDrawer(), ScrollingDrawer(), SlideDrawer(),
            SwapDrawer(), ThinWormDrawer(), ThinWormHeadsDrawer(), WormDrawer()
        ]
        let rect = CGRect(x: 0, y: 0, width: 300, height: 40)
        for drawer in drawers {
            let view = AdvancedPageControlView(frame: rect)
            view.drawer = drawer
            view.alignment = .left
            view.draw(rect)
        }
    }

    func testAllDrawersDrawWithRightAlignment() {
        let drawers: [AdvancedPageControlDraw] = [
            ColorBlendDrawer(), DropDrawer(), ExtendedDotDrawer(),
            InfiniteDrawer(), InfiniteScrollingDrawer(), JumpDrawer(),
            ScaleDrawer(), ScrollingDrawer(), SlideDrawer(),
            SwapDrawer(), ThinWormDrawer(), ThinWormHeadsDrawer(), WormDrawer()
        ]
        let rect = CGRect(x: 0, y: 0, width: 300, height: 40)
        for drawer in drawers {
            let view = AdvancedPageControlView(frame: rect)
            view.drawer = drawer
            view.alignment = .right
            view.draw(rect)
        }
    }

    static var allTests = [
        ("testDefaultAlignmentIsCenter", testDefaultAlignmentIsCenter),
        ("testSettingAlignmentSyncsToDrawer", testSettingAlignmentSyncsToDrawer),
        ("testSettingAlignmentToRightSyncsToDrawer", testSettingAlignmentToRightSyncsToDrawer),
        ("testSettingAlignmentToCenterSyncsToDrawer", testSettingAlignmentToCenterSyncsToDrawer),
        ("testNewDrawerInheritsCurrentAlignment", testNewDrawerInheritsCurrentAlignment),
        ("testNewDrawerInheritsRightAlignment", testNewDrawerInheritsRightAlignment),
        ("testDrawWithLeftAlignmentDoesNotCrash", testDrawWithLeftAlignmentDoesNotCrash),
        ("testDrawWithRightAlignmentDoesNotCrash", testDrawWithRightAlignmentDoesNotCrash),
        ("testAllDrawersDrawWithLeftAlignment", testAllDrawersDrawWithLeftAlignment),
        ("testAllDrawersDrawWithRightAlignment", testAllDrawersDrawWithRightAlignment),
    ]
}
