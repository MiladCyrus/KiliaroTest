//
//  UtilitiesTests.swift
//  KiliaroTests
//
//  Created by Milad on 9/22/1400 AP.
//

import XCTest
@testable import Kiliaro

class UtilitiesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBytesToMegabytes() {
        let bytes = 524_288
        let mb = Utilities.bytesToMegabytes(bytes: bytes)
        XCTAssertEqual(mb, "0.50 MB")
    }

}
