//
//  UserDataManager.swift
//  Yolandia
//
//  Created by Roland on 25/06/2014.
//  Copyright (c) 2014 mapps. All rights reserved.
//

import Foundation

class UserDataManager {
    
    var usersArray = [ "test1", "test2", "test3", "test4" ]
    
    init() {
        //        usersArray = [ "test1", "test2", "test3", "test4" ]
        
        User.getMyUsers( { (userNames, error) in
            self.usersArray = userNames as String[]
            })
    }
    
    
    func users() -> String[] {
        return usersArray
    }
}