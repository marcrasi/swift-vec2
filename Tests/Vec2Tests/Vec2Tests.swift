import XCTest
@testable import Vec2

final class Vec2Tests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Vec2().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
