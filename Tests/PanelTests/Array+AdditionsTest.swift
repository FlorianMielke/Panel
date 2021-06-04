/**
*  Panel
*  Copyright (c) Florian Mielke 2021
*  MIT license, see LICENSE file for details
*/

import XCTest
@testable import Panel

class Array_AdditionsTest: XCTestCase {
    
}

// MARK: - Nearest
extension Array_AdditionsTest {
    func testFindNearest() {
        let subject = [1.4, 2.3, 4.7, 5.23, 10.02]
        
        XCTAssertEqual(2.3, subject.nearest(to: 3))
        XCTAssertEqual(5.23, subject.nearest(to: 7))
        XCTAssertEqual(10.02, subject.nearest(to: 8))
    }
    
    static var allTests = [
        ("testFindNearest", testFindNearest),
    ]
}
