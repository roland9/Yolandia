//
//  User.swift
//  Yolandia
//
//  Created by Roland on 19/06/2014.
//  Copyright (c) 2014 mapps. All rights reserved.
//

import Foundation
import CloudKit

let recordType = "MyUser"
let userNameField = "userName"
let signupDateField = "signupDate"

class User {
    
    class func saveUser(userName: String, completionHandler: ((CKRecord!, NSError!) -> Void)!) {
        
        println("trying to save User with userName=\(userName)")
        
        let publicDatabase = CKContainer.defaultContainer().publicCloudDatabase
        var user = CKRecord(recordType: recordType)
        
        user.setObject(userName, forKey:userNameField)
        user.setObject(NSDate(), forKey:signupDateField)
        
        publicDatabase.saveRecord(user, completionHandler: {
            
            (savedRecord, error) in
                if (!error) {
                    println("saved record: \(savedRecord)")
                    
                } else {
                    println("ERROR \(error.localizedDescription) saving record")
                }
            }
        )
    }
    
    class func findUser(userName: String, completionHandler: ((CKRecord[]!, NSError!) -> Void)!) {
        
        println("trying to find User with userName=\(userName)")
        
        let publicDatabase = CKContainer.defaultContainer().publicCloudDatabase
        
        let predicate = NSPredicate(format: "\(userNameField) = %", userName)
        let query = CKQuery(recordType: recordType, predicate: predicate)
        
        publicDatabase.performQuery(query, inZoneWithID: nil, completionHandler: {
            
            (results, error) in
                if (!error) {
                    println("found records: \(results)")
                    
                } else {
                    println("ERROR \(error.localizedDescription) finding record")
                }
            }
        )
    }
    
}