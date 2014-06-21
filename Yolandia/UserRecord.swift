//
//  UserRecord.swift
//  Yolandia
//
//  Created by Roland on 19/06/2014.
//  Copyright (c) 2014 mapps. All rights reserved.
//

import Foundation
import CloudKit

class User {
    
    class func saveUser(userName: String, completionHandler: ((CKRecord!, NSError!) -> Void)!) {
        
        println("trying to save User with userName=\(userName)")
        
        let publicDatabase = CKContainer.defaultContainer().publicCloudDatabase
        var user = CKRecord(recordType: "MyUser")
        
        user.setObject(userName, forKey:"userName")
        user.setObject(NSDate(), forKey:"signupDate")
        
        publicDatabase.saveRecord(user, completionHandler: {(savedRecord, error) in
            if (!error) {
                println("saved record: \(savedRecord)")
                
            } else {
                println("ERROR \(error.localizedDescription) saving record")
            }
            })
    }
    
}