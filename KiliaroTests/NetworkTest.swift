//
//  NetworkTest.swift
//  KiliaroTests
//
//  Created by Milad on 9/22/1400 AP.
//

import XCTest

@testable import Kiliaro
class NetworkTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testNetwork_GetSharedMedia() {
        let expectation = self.expectation(description: "waitForNetwork")
            APIHelper().makeGetRequest(uri: RequestUrls().getSharedMedia, pagination: Pagination(offset: 0, limit: 2)) { response in
                do {
                    let res = try JSONDecoder().decode([SharedMedia].self, from: response)
                    XCTAssertNotNil(res)
                    XCTAssertEqual(res.count, 2)
                    //XCTAssertTrue(type(of: res.first!) == SharedMedia.self)
                } catch  {
                    print(error)
                }
                expectation.fulfill()
            }
        waitForExpectations(timeout: 15, handler: nil)
    }
    
    func testMakePaginationParameters() {
        let helper = APIHelper()
        let params = helper.makeParameters(param: Pagination(offset: 0, limit: 2))
        
        XCTAssertEqual(params, "?offset=0&limit=2")
    }
    
}
