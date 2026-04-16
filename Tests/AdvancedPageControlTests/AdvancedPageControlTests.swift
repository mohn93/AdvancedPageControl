import XCTest
@testable import AdvancedPageControl

final class DrawerParentTests: XCTestCase {

    // MARK: - Default Initialization

    func testDefaultInitValues() {
        let parent = AdvancedPageControlDrawerParent()
        XCTAssertEqual(parent.numberOfPages, 5)
        XCTAssertEqual(parent.size, 16)
        XCTAssertEqual(parent.width, 16)
        XCTAssertEqual(parent.space, 16)
        XCTAssertEqual(parent.radius, 16)
        XCTAssertEqual(parent.currentItem, 0)
        XCTAssertEqual(parent.dotsColor, UIColor.lightGray)
        XCTAssertEqual(parent.isBordered, false)
        XCTAssertEqual(parent.borderColor, UIColor.white)
        XCTAssertEqual(parent.borderWidth, 1)
    }

    // MARK: - Custom Initialization

    func testCustomInitValues() {
        let parent = AdvancedPageControlDrawerParent(
            numberOfPages: 10,
            height: 20,
            width: 30,
            space: 8,
            raduis: 4,
            currentItem: 3,
            dotsColor: .red,
            isBordered: true,
            borderColor: .blue,
            borderWidth: 2
        )
        XCTAssertEqual(parent.numberOfPages, 10)
        XCTAssertEqual(parent.size, 20)
        XCTAssertEqual(parent.width, 30)
        XCTAssertEqual(parent.space, 8)
        XCTAssertEqual(parent.radius, 4)
        XCTAssertEqual(parent.currentItem, 3)
        XCTAssertEqual(parent.dotsColor, UIColor.red)
        XCTAssertEqual(parent.isBordered, true)
        XCTAssertEqual(parent.borderColor, UIColor.blue)
        XCTAssertEqual(parent.borderWidth, 2)
    }

    // MARK: - Property Mutation

    func testPropertiesAreMutableAfterInit() {
        let parent = AdvancedPageControlDrawerParent()
        parent.width = 24
        parent.space = 12
        parent.radius = 6
        parent.numberOfPages = 8
        parent.size = 32
        parent.currentItem = 2.5
        parent.dotsColor = .green
        parent.isBordered = true
        parent.borderColor = .black
        parent.borderWidth = 3

        XCTAssertEqual(parent.width, 24)
        XCTAssertEqual(parent.space, 12)
        XCTAssertEqual(parent.radius, 6)
        XCTAssertEqual(parent.numberOfPages, 8)
        XCTAssertEqual(parent.size, 32)
        XCTAssertEqual(parent.currentItem, 2.5)
        XCTAssertEqual(parent.dotsColor, UIColor.green)
        XCTAssertEqual(parent.isBordered, true)
        XCTAssertEqual(parent.borderColor, UIColor.black)
        XCTAssertEqual(parent.borderWidth, 3)
    }

    // MARK: - getScaleFactor

    func testGetScaleFactorAtIntegerPosition() {
        let parent = AdvancedPageControlDrawerParent()
        let scale = parent.getScaleFactor(currentItem: 2.0, ratio: 10.0)
        XCTAssertEqual(scale, 0.0, accuracy: 0.001)
    }

    func testGetScaleFactorAtHalfPosition() {
        let parent = AdvancedPageControlDrawerParent()
        let scale = parent.getScaleFactor(currentItem: 2.5, ratio: 10.0)
        XCTAssertEqual(scale, 5.0, accuracy: 0.001)
    }

    func testGetScaleFactorAtQuarterPosition() {
        let parent = AdvancedPageControlDrawerParent()
        let scale = parent.getScaleFactor(currentItem: 2.25, ratio: 10.0)
        XCTAssertEqual(scale, 2.5, accuracy: 0.001)
    }

    func testGetScaleFactorAtThreeQuarterPosition() {
        let parent = AdvancedPageControlDrawerParent()
        let scale = parent.getScaleFactor(currentItem: 2.75, ratio: 10.0)
        XCTAssertEqual(scale, 2.5, accuracy: 0.001)
    }

    func testGetScaleFactorSymmetry() {
        let parent = AdvancedPageControlDrawerParent()
        let scale1 = parent.getScaleFactor(currentItem: 1.25, ratio: 20.0)
        let scale2 = parent.getScaleFactor(currentItem: 1.75, ratio: 20.0)
        XCTAssertEqual(scale1, scale2, accuracy: 0.001)
    }

    // MARK: - getCenteredYPosition

    func testCenteredYPositionCentersDotVertically() {
        let parent = AdvancedPageControlDrawerParent(height: 10)
        let rect = CGRect(x: 0, y: 0, width: 200, height: 40)
        let y = parent.getCenteredYPosition(rect, dotSize: 10)
        XCTAssertEqual(y, 15.0, accuracy: 0.001)
    }

    func testCenteredYPositionWithLargeDot() {
        let parent = AdvancedPageControlDrawerParent(height: 40)
        let rect = CGRect(x: 0, y: 0, width: 200, height: 40)
        let y = parent.getCenteredYPosition(rect, dotSize: 40)
        XCTAssertEqual(y, 0.0, accuracy: 0.001)
    }

    // MARK: - getCenteredXPosition

    func testCenteredXPositionFirstDot() {
        let parent = AdvancedPageControlDrawerParent(numberOfPages: 3, width: 10, space: 5)
        let rect = CGRect(x: 0, y: 0, width: 200, height: 40)
        let x = parent.getCenteredXPosition(rect, itemPos: 0, dotSize: 10, space: 5, numberOfPages: 3)
        XCTAssertEqual(x, 79.0, accuracy: 0.001)
    }

    func testCenteredXPositionMiddleDot() {
        let parent = AdvancedPageControlDrawerParent(numberOfPages: 3, width: 10, space: 5)
        let rect = CGRect(x: 0, y: 0, width: 200, height: 40)
        let x = parent.getCenteredXPosition(rect, itemPos: 1, dotSize: 10, space: 5, numberOfPages: 3)
        XCTAssertEqual(x, 94.0, accuracy: 0.001)
    }

    func testCenteredXPositionDotsAreEvenlySpaced() {
        let parent = AdvancedPageControlDrawerParent(numberOfPages: 5, width: 10, space: 5)
        let rect = CGRect(x: 0, y: 0, width: 300, height: 40)
        let x0 = parent.getCenteredXPosition(rect, itemPos: 0, dotSize: 10, space: 5, numberOfPages: 5)
        let x1 = parent.getCenteredXPosition(rect, itemPos: 1, dotSize: 10, space: 5, numberOfPages: 5)
        let x2 = parent.getCenteredXPosition(rect, itemPos: 2, dotSize: 10, space: 5, numberOfPages: 5)
        XCTAssertEqual(x1 - x0, 15.0, accuracy: 0.001)
        XCTAssertEqual(x2 - x1, 15.0, accuracy: 0.001)
    }

    static var allTests = [
        ("testDefaultInitValues", testDefaultInitValues),
        ("testCustomInitValues", testCustomInitValues),
        ("testPropertiesAreMutableAfterInit", testPropertiesAreMutableAfterInit),
        ("testGetScaleFactorAtIntegerPosition", testGetScaleFactorAtIntegerPosition),
        ("testGetScaleFactorAtHalfPosition", testGetScaleFactorAtHalfPosition),
        ("testGetScaleFactorAtQuarterPosition", testGetScaleFactorAtQuarterPosition),
        ("testGetScaleFactorAtThreeQuarterPosition", testGetScaleFactorAtThreeQuarterPosition),
        ("testGetScaleFactorSymmetry", testGetScaleFactorSymmetry),
        ("testCenteredYPositionCentersDotVertically", testCenteredYPositionCentersDotVertically),
        ("testCenteredYPositionWithLargeDot", testCenteredYPositionWithLargeDot),
        ("testCenteredXPositionFirstDot", testCenteredXPositionFirstDot),
        ("testCenteredXPositionMiddleDot", testCenteredXPositionMiddleDot),
        ("testCenteredXPositionDotsAreEvenlySpaced", testCenteredXPositionDotsAreEvenlySpaced),
    ]
}
