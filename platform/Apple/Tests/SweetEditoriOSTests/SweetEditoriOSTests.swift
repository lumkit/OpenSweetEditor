import XCTest
@testable import SweetEditoriOS

final class SweetEditoriOSTests: XCTestCase {
    func testModuleCompiles() {
        XCTAssertTrue(true)
    }

    func testIOSScrollbarPolicyProvidesTransientDefaults() {
        let policy = IOSScrollbarPolicy()

        XCTAssertEqual(policy.defaultThickness, 8.0, accuracy: 0.001)
        XCTAssertEqual(policy.defaultMinThumb, 48.0, accuracy: 0.001)
        XCTAssertEqual(policy.defaultThumbHitPadding, 16.0, accuracy: 0.001)
    }
}
