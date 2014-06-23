// Playground - noun: a place where people can play

import Cocoa
import CloudKit

var str = "Hello, playground"

class User {
    
    class func saveUser(userName: String) {
        println("testing \(userName)")
    }
}

User.saveUser("here is my name")
