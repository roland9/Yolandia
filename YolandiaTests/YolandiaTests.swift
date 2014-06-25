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
    
    func testUserSearchingNonExistent() {
        let expectation = self.expectationWithDescription("check for non-existent user")
        let userName = "testUserNonExisting"
        
        var results: CKRecord[], error: NSError
        
        User.checkIfUserExists(userName, completionHandler: { (doesUserExist, error) in
            if (!error) {
                XCTAssert(!doesUserExist)
                expectation.fulfill()
            } else {
                XCTAssert(false)
            }
            })
        
        self.waitForExpectationsWithTimeout(5, handler: nil)
    }
    
    func testUserSearchingExistent() {
        let expectation = self.expectationWithDescription("check for existing user")
        let userName = "testUserExisting"
        
        var results: CKRecord[], error: NSError
        
        User.checkIfUserExists(userName, completionHandler: { (doesUserExist, error) in
            if (!error) {
                XCTAssert(doesUserExist)
                expectation.fulfill()
            } else {
                XCTAssert(false)
            }
            })
        
        self.waitForExpectationsWithTimeout(5, handler: nil)
    }
    
    func testUserSaving() {
        let expectation = self.expectationWithDescription("save a user")
        let userName = "testUserExisting"
        
        var user: CKRecord, error: NSError
        User.saveNewUser(userName, completionHandler: { (user, error) in
            if (!error) {
                XCTAssert(true)
                expectation.fulfill()
            } else {
                XCTAssert(false)
            }
            })
        
        self.waitForExpectationsWithTimeout(5, handler: nil)
    }
    
    func testGetMyUsers() {
        let expectation = self.expectationWithDescription("get user list")
        
        User.getMyUsers( { (userNames, error) in
            if (!error) {
                if (userNames == [ "Roland", "Batman", "DummyUser" ]) {
                    XCTAssert(true)
                    expectation.fulfill()
                } else {
                    XCTAssert(false)
                }
            } else {
                XCTAssert(false)
            }
            })
        self.waitForExpectationsWithTimeout(5, handler: nil)
    }
}
