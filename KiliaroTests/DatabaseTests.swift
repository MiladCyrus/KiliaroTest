//
//  DatabaseTests.swift
//  KiliaroTests
//
//  Created by Milad on 9/22/1400 AP.
//

import XCTest
@testable import Kiliaro
class DatabaseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDatabase_fetchObjects() {
        Utilities.RealmThread {
            let object = SharedMediaRealmObj()
            object.id = 222
            let db = DBLayer()
            db.addObject(obj: object)
            let fetched = DBLayer().getObjects(type: SharedMediaRealmObj.self).filter("id == 222").first as? SharedMediaRealmObj
            XCTAssertEqual(object.id, fetched?.id)
            
            db.removeObject(obj: object)
            let fetched2 = DBLayer().getObjects(type: SharedMediaRealmObj.self).filter("id == 222").first as? SharedMediaRealmObj
            XCTAssertNil(fetched2)
        }
    }

}
