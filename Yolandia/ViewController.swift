//
//  ViewController.swift
//  Yolandia
//
//  Created by Roland on 19/06/2014.
//  Copyright (c) 2014 mapps. All rights reserved.
//

import UIKit
import CloudKit

class ViewController: UIViewController, UITextFieldDelegate, UIAlertViewDelegate {
    
    @IBOutlet var userNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userNameTextField.delegate = self
        
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        println("textfield.text=\(textField.text)")
        var user: CKRecord
        var error: NSError
        let userName = textField.text
        
        User.checkIfUserExists(userName, completionHandler: {(doesUserExist, error) in
            if (error) {
                self.showAlert("Error Checking User Name", message: "Please try again later")
                
            } else if (doesUserExist == true) {
                self.showAlert("User already exists", message: "Please try another user name")
                
            } else {
                
                User.saveNewUser(userName, completionHandler: { (savedRecord, error) in
                    
                    if (savedRecord) {
//                        self.showAlert("Saved Your User Name", message: "Congrats - you claimed your user name")

                        let usersTableViewController = UsersTableViewController(style: UITableViewStyle.Grouped)
                        NSOperationQueue.mainQueue().addOperationWithBlock {
                            self.presentViewController(usersTableViewController, animated: true, completion: nil)
                        }
                        
                    } else {
                        self.showAlert("Somthing Went Wrong...", message: "Oops - could not claim that user name.\nPlease try again later")
                        
                    }
                    })
                
            }
            })
        
        return true
    }
    
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let defaultAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { action in
            alert.dismissViewControllerAnimated(true, completion: nil)
            })
        alert.addAction(defaultAction)
        
        NSOperationQueue.mainQueue().addOperationWithBlock {
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
}

