//
//  User.swift
//  Yolandia
//
//  Created by Roland on 19/06/2014.
//  Copyright (c) 2014 mapps. All rights reserved.
//

import Foundation
import CloudKit

// switch between local mockups & CloudKit calls
let isLocalMockupActive = false

// records in public database
let recordTypePublic = "AllUsers"
let userNameField = "userName"

// records in private database
let recordTypeMyUsersPrivate = "MyUsers"

class User {
    
    // public
    class func checkIfUserExists(userName: String, completionHandler: ((Bool!, NSError!) -> Void)!) {
        assert(userName != .None, "userName mandatory")
        
        if (isLocalMockupActive) {
            self.localCheckIfUserExists(userName, completionHandler)
            return
        }
        
        let publicDatabase = CKContainer.defaultContainer().publicCloudDatabase
        
        let predicate = NSPredicate(format: "\(userNameField) = '\(userName)'")
        let query = CKQuery(recordType: recordTypePublic, predicate: predicate)
        
        publicDatabase.performQuery(query, inZoneWithID: nil, completionHandler: { (results, error) in
            println("found records \(results) with userName=\(userName)")
            if (error != nil) {
                completionHandler(results.count>0, error)
            } else {
                println("ERROR \(error.localizedDescription) performing query")
                completionHandler(false, error)
            }
            }
        )
    }
    
    class func saveNewUser(userName: String, completionHandler: ((CKRecord!, NSError!) -> Void)!) {
        assert(userName != .None, "userName mandatory")
        
        if (isLocalMockupActive) {
            self.localSaveNewUser(userName, completionHandler)
            return
        }
        
        let publicDatabase = CKContainer.defaultContainer().publicCloudDatabase
        
        var user = CKRecord(recordType: recordTypePublic)
        user.setObject(userName, forKey:userNameField)
        
        publicDatabase.saveRecord(user, completionHandler: { (savedRecord, error) in
            if (error == nil) {
                println("saved record: \(savedRecord)")
                completionHandler(savedRecord, error)
            } else {
                println("ERROR \(error.localizedDescription) saving record")
                completionHandler(nil, error)
            }
            }
        )
    }
    
    class func getMyUsers(completionHandler:(([String]!, NSError!) -> Void)!) {
        if (isLocalMockupActive) {
            self.localGetMyUsers(completionHandler)
            return
        }
        
        let privateDatabase = CKContainer.defaultContainer().privateCloudDatabase
        
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: recordTypeMyUsersPrivate, predicate: predicate)
        
        privateDatabase.performQuery(query, inZoneWithID: nil, completionHandler: { (results, error) in
            if (error == nil) {
                let resultsArray = results as [CKRecord]
                let userNamesArray = resultsArray.map( {
                    (userRecord: CKRecord) -> String in
                    return userRecord.objectForKey(userNameField) as String
                })
                println("found records: \(results)")
                completionHandler(nil, error)
            } else {
                println("ERROR \(error.localizedDescription) finding record")
                completionHandler(nil, error)
            }
            }
        )
    }
    
    
    // private
    class func localCheckIfUserExists(userName: String, completionHandler: ((Bool!, NSError!) -> Void)!) {
        if (userName.hasPrefix("t")) {
            completionHandler( true, nil )
        } else {
            completionHandler( false, nil)
        }
    }
    
    class func localSaveNewUser(userName: String, completionHandler: ((CKRecord!, NSError!) -> Void)!) {
        let userRecord = CKRecord(recordType: recordTypePublic)
        completionHandler( userRecord, nil )
    }
    
    class func localGetMyUsers(completionHandler:(([String]!, NSError!) -> Void)!) {
        let userNames = [ "Roland", "Batman", "DummyUser" ]
        completionHandler(userNames, nil)
    }
}