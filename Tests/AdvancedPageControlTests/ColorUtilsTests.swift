import XCTest
@testable import AdvancedPageControl

final class ColorUtilsTests: XCTestCase {

    private func assertColorComponents(
        _ color: UIColor,
        red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat,
        accuracy: CGFloat = 0.01,
        file: StaticString = #file, line: UInt = #line
    ) {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        color.getRed(&r, green: &g, blue: &b, alpha: &a)
        XCTAssertEqual(r, red, accuracy: accuracy, file: file, line: line)
        XCTAssertEqual(g, green, accuracy: accuracy, file: file, line: line)
        XCTAssertEqual(b, blue, accuracy: accuracy, file: file, line: line)
        XCTAssertEqual(a, alpha, accuracy: accuracy, file: file, line: line)
    }

    // MARK: - addColor

    func testAddBlackAndWhite() {
        let result = addColor(.black, with: .white)
        assertColorComponents(result, red: 1, green: 1, blue: 1, alpha: 1)
    }

    func testAddColorClampedToOne() {
        let result = addColor(.white, with: .white)
        assertColorComponents(result, red: 1, green: 1, blue: 1, alpha: 1)
    }

    func testAddRedAndBlue() {
        let result = addColor(.red, with: .blue)
        assertColorComponents(result, red: 1, green: 0, blue: 1, alpha: 1)
    }

    func testAddBlackAndBlack() {
        let result = addColor(.black, with: .black)
        assertColorComponents(result, red: 0, green: 0, blue: 0, alpha: 1)
    }

    // MARK: - multiplyColor

    func testMultiplyByZero() {
        let result = multiplyColor(.white, by: 0)
        assertColorComponents(result, red: 0, green: 0, blue: 0, alpha: 1)
    }

    func testMultiplyByOne() {
        let result = multiplyColor(.red, by: 1.0)
        assertColorComponents(result, red: 1, green: 0, blue: 0, alpha: 1)
    }

    func testMultiplyByHalf() {
        let result = multiplyColor(.white, by: 0.5)
        assertColorComponents(result, red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
    }

    // MARK: - Operator Overloads

    func testPlusOperator() {
        let result = UIColor.red + UIColor.green
        assertColorComponents(result, red: 1, green: 1, blue: 0, alpha: 1)
    }

    func testMultiplyOperator() {
        let result = UIColor.white * 0.5
        assertColorComponents(result, red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
    }

    func testMultiplyOperatorByZero() {
        let result = UIColor.red * 0.0
        assertColorComponents(result, red: 0, green: 0, blue: 0, alpha: 1)
    }

    // MARK: - Color Blending (as used by drawers)

    func testBlendingInterpolation() {
        let progress = 0.5
        let result = (UIColor.red * progress) + (UIColor.blue * (1 - progress))
        assertColorComponents(result, red: 0.5, green: 0, blue: 0.5, alpha: 1)
    }

    func testBlendingAtZeroProgress() {
        let result = (UIColor.red * 0.0) + (UIColor.blue * 1.0)
        assertColorComponents(result, red: 0, green: 0, blue: 1, alpha: 1)
    }

    func testBlendingAtFullProgress() {
        let result = (UIColor.red * 1.0) + (UIColor.blue * 0.0)
        assertColorComponents(result, red: 1, green: 0, blue: 0, alpha: 1)
    }

    static var allTests = [
        ("testAddBlackAndWhite", testAddBlackAndWhite),
        ("testAddColorClampedToOne", testAddColorClampedToOne),
        ("testAddRedAndBlue", testAddRedAndBlue),
        ("testAddBlackAndBlack", testAddBlackAndBlack),
        ("testMultiplyByZero", testMultiplyByZero),
        ("testMultiplyByOne", testMultiplyByOne),
        ("testMultiplyByHalf", testMultiplyByHalf),
        ("testPlusOperator", testPlusOperator),
        ("testMultiplyOperator", testMultiplyOperator),
        ("testMultiplyOperatorByZero", testMultiplyOperatorByZero),
        ("testBlendingInterpolation", testBlendingInterpolation),
        ("testBlendingAtZeroProgress", testBlendingAtZeroProgress),
        ("testBlendingAtFullProgress", testBlendingAtFullProgress),
    ]
}
