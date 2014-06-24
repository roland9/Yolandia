//
//  ViewController.swift
//  Yolandia
//
//  Created by Roland on 19/06/2014.
//  Copyright (c) 2014 mapps. All rights reserved.
//

import UIKit
import CloudKit

class ViewController: UIViewController, UITextFieldDelegate {
                            
    @IBOutlet var userNameTextField: UITextField
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userNameTextField.delegate = self
        
    }

    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        println("textfield.text=\(textField.text)")
        var user: CKRecord
        var error: NSError
        User.saveNewUser(textField.text, completionHandler: {(user, error) in
            println("user=\(user)")
            })
        return true
    }

}

