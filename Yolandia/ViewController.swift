//
//  ViewController.swift
//  Yolandia
//
//  Created by Roland on 19/06/2014.
//  Copyright (c) 2014 mapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
                            
    @IBOutlet var userNameTextField: UITextField
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userNameTextField.delegate = self
        
    }

    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        println("textfield=%s", textField)
        var user = User.saveUser("RolandG")
        return true
    }

}

