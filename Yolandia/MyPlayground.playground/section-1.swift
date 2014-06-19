// Playground - noun: a place where people can play

import Cocoa
import CloudKit

var str = "Hello, playground"

class UserRecord {
    
    class func saveUser(userName: String) {
        println("testing \(userName)")
    }
}

UserRecord.saveUser("here is my name")