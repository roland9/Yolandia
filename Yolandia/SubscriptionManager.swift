//
//  SubscriptionManager.swift
//  Yolandia
//
//  Created by Roland on 28/06/2014.
//  Copyright (c) 2014 mapps. All rights reserved.
//

import Foundation
import CloudKit

class SubscriptionManager {
    
    class func createSubscription() -> Void {
        let userName = "rolandg"
        let predicate = NSPredicate(format: "userPushRecipient = '\(userName)'")
        let subscription = CKSubscription(recordType: recordTypePublic, predicate: predicate, options: CKSubscriptionOptions.FiresOnRecordCreation)
        
        let notificationInfo = CKNotificationInfo()
        notificationInfo.alertActionLocalizationKey = "LOCAL_NOTIFICATION_KEY"
        //        notificationInfo.soundName = ".aiff"
        notificationInfo.shouldBadge = true
        
        subscription.notificationInfo = notificationInfo
        
        let publicDatabase = CKContainer.defaultContainer().publicCloudDatabase
        publicDatabase.saveSubscription(subscription, completionHandler: { (returnedSubscription, error) in
            
            if (error != nil) {
                println("error=\(error.localizedDescription)")
            } else {
                println("sving subscription OK")
            }
            
        })
    }
    
}