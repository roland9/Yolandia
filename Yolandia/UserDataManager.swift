//
//  UserDataManager.swift
//  Yolandia
//
//  Created by Roland on 25/06/2014.
//  Copyright (c) 2014 mapps. All rights reserved.
//

import Foundation

class UserDataManager {
    
    var usersArray:[String] = []
    
    init() {
// todoRG called twice?!?
        User.getMyUsers( { (userNames, error) in
            if (!error) {
                self.usersArray = userNames as [String]
                NSNotificationCenter.defaultCenter().postNotificationName(kDidReceiveDataNotification, object: nil)
            }
            })
        
//        let delay = 4.5 * Double(NSEC_PER_SEC)
//        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
//        dispatch_after(time, dispatch_get_main_queue(), {
//            NSNotificationCenter.defaultCenter().postNotificationName(kDidReceiveDataNotification, object: nil)
//            })
    }
    
    func users() -> [String] {
        return self.usersArray
    }
}