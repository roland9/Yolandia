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
    
    class func saveUser(userName: String) -> Bool {
        println("trying to save \(userName)")

        let publicDatabase = CKContainer.defaultContainer().publicCloudDatabase
        let user = CKRecord(recordType: "MyUser")
        user.setObject("Roland", forKey:"userName")

        publicDatabase.saveRecord(user, completionHandler: {(savedRecord, error) in
            println("saved: \(savedRecord)  \(error)")
            })
        
        return true
    }
    
}