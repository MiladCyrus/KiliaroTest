//
//  ThumbnailResizerTests.swift
//  KiliaroTests
//
//  Created by Milad on 9/22/1400 AP.
//

import XCTest
@testable import Kiliaro

class ThumbnailResizerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testThumbnailResizer() {
        let obj = ThumbnailResizer()
        let param = obj.makeParameters(param: ImageResizer(w: 100, h: 100, m: .boundingBox))
        XCTAssertEqual(param, "?w=100&h=100&m=bb")
    }

}
