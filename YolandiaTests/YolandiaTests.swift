//
//  YolandiaTests.swift
//  YolandiaTests
//
//  Created by Roland on 19/06/2014.
//  Copyright (c) 2014 mapps. All rights reserved.
//

import XCTest
import CloudKit

class YolandiaTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUserSaving() {
        let expectation = self.expectationWithDescription("save a user")

        var user: CKRecord
        var error: NSError
        User.saveUser("testUser", completionHandler: {(user, error) in
            println("user=\(user)")
            })
        
        self.waitForExpectationsWithTimeout(5, handler: nil)
    }

}
