//
//  KiliaroTests.swift
//  KiliaroTests
//
//  Created by Milad on 9/19/1400 AP.
//

import XCTest
@testable import Kiliaro

class KiliaroTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNetwork_GetSharedMedia() {
            APIHelper().makeGetRequest(uri: RequestUrls().getSharedMedia, pagination: Pagination(offset: 0, limit: 2)) { response in
                do {
                    let res = try JSONDecoder().decode([SharedMedia].self, from: response)
                    //XCTAssertNotNil(res)
                    //XCTAssertEqual(res.count, 0)
                } catch  {
                    print(error)
                }
                 
            }
    }
    
    func testUtilities_bytesToMegabytes() {
        
    }

}
