//
//  User.swift
//  Yolandia
//
//  Created by Roland on 19/06/2014.
//  Copyright (c) 2014 mapps. All rights reserved.
//

import Foundation
import CloudKit

// records in public database
let recordTypePublic = "AllUsers"
let userNameField = "userName"

// records in private database
let recordTypeMyUsersPrivate = "MyUsers"

class User {
    
    // public
    class func checkIfUserExists(userName: String, completionHandler: ((Bool!, NSError!) -> Void)!) {
        assert(userName != nil, "userName mandatory")
        let publicDatabase = CKContainer.defaultContainer().publicCloudDatabase
        
        println("trying to find userName=\(userName)")
        
        let predicate = NSPredicate(format: "\(userNameField) = '\(userName)'")
        let query = CKQuery(recordType: recordTypePublic, predicate: predicate)
        
        publicDatabase.performQuery(query, inZoneWithID: nil, completionHandler: { (results, error) in
            println("found records \(results) with userName=\(userName)")
            if (!error) {
                completionHandler(results.count>0, error)
            } else {
                println("ERROR \(error.localizedDescription) performing query")
                completionHandler(false, error)
            }
            }
        )
    }

    class func saveNewUser(userName: String, completionHandler: ((CKRecord!, NSError!) -> Void)!) {
        assert(userName != nil, "userName mandatory")
        let publicDatabase = CKContainer.defaultContainer().publicCloudDatabase
        
        var user = CKRecord(recordType: recordTypePublic)
        user.setObject(userName, forKey:userNameField)
        
        publicDatabase.saveRecord(user, completionHandler: { (savedRecord, error) in
            if (!error) {
                println("saved record: \(savedRecord)")
                completionHandler(savedRecord, error)
            } else {
                println("ERROR \(error.localizedDescription) saving record")
                completionHandler(nil, error)
            }
            }
        )
    }
   
    class func getMyUsers(completionHandler:((CKRecord[]!, NSError!) -> Void)!) {
        let privateDatabase = CKContainer.defaultContainer().privateCloudDatabase
        
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: recordTypeMyUsersPrivate, predicate: predicate)
        
        privateDatabase.performQuery(query, inZoneWithID: nil, completionHandler: { (results, error) in
            if (!error) {
                let resultsArray = results as CKRecord[]
                println("found records: \(results)")
                completionHandler(resultsArray, error)
            } else {
                println("ERROR \(error.localizedDescription) finding record")
                completionHandler(nil, error)
            }
            }
        )
    }
    
    
    // private
}