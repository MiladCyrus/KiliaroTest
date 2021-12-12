//
//  URLsTests.swift
//  KiliaroTests
//
//  Created by Milad on 9/22/1400 AP.
//

import XCTest

@testable import Kiliaro
class URLsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBaseUrl(){
        XCTAssertEqual(BaseUrl.getBaseUrl(), "https://api1.kiliaro.com")
    }
    
    func testGetSharedMediaUrl(){
        XCTAssertEqual(RequestUrls().getSharedMedia, "/shared/\(SHARED_KEY)/media")
    }
    
    func testSHAREDKEY() {
        XCTAssertEqual(SHARED_KEY, "djlCbGusTJamg_ca4axEVw")
    }

}
