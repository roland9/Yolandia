//
//  AddContactFooterView.swift
//  Yolandia
//
//  Created by Roland Gröpmair on 16/08/2014.
//  Copyright (c) 2014 mapps. All rights reserved.
//

import UIKit

class AddContactFooterView: UITableViewHeaderFooterView {
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTranslatesAutoresizingMaskIntoConstraints(false)
        button.titleLabel?.font = UIFont(name: "Avenir", size: 32)
        button.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        button.setTitle("+", forState: UIControlState.Normal)
        button.backgroundColor = UIColor.greenColor()
        button.layer.cornerRadius = 22
        button.addTarget(self, action: "didSelectAdd:", forControlEvents: UIControlEvents.TouchUpInside)
        return button
        }()
    
    lazy var inputTextField: UITextField = {
        let input = UITextField()
        input.setTranslatesAutoresizingMaskIntoConstraints(false)
        input.backgroundColor = UIColor.yellowColor()
        return input
        }()
    
    lazy var backgroundRoundedView: UIView = {
        let view = UIView()
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.backgroundColor = UIColor.brownColor()
        view.layer.cornerRadius = 5
        return view
        }()
    
    var myConstraints = NSMutableArray()
    var isEnterTextMode = false
    
    // why is this required?!?
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(reuseIdentifier: String!) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.addSubview(backgroundRoundedView)
        self.addSubview(inputTextField)
        self.addSubview(addButton)
        //        self.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.setNeedsUpdateConstraints()
        
        let views = [
            "addButton": addButton,
            "inputTextField": inputTextField,
            "backgroundView": backgroundRoundedView
        ]
        
        let metrics = [
            "margin": 12,
            "leftMargin": 16,
            "lineMargin": 14
        ]
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.removeConstraints(self.myConstraints)
        self.myConstraints .removeAllObjects()
        
        self.myConstraints.addObjectsFromArray(
            [
                // backgroundRoundedView
                NSLayoutConstraint(item: backgroundRoundedView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 50),
                NSLayoutConstraint(item: backgroundRoundedView, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: backgroundRoundedView, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0),
                
                // addButton
                NSLayoutConstraint(item: addButton, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 44),
                NSLayoutConstraint(item: addButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 44),
                NSLayoutConstraint(item: addButton, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0),
                
                // inputTextField
                NSLayoutConstraint(item: inputTextField, attribute: .Height, relatedBy: .Equal, toItem: addButton, attribute: .Height, multiplier: 1, constant: -10),
                NSLayoutConstraint(item: inputTextField, attribute: .RightMargin, relatedBy: .Equal, toItem: self.addButton, attribute: .LeftMargin, multiplier: 1, constant: 10),
                NSLayoutConstraint(item: inputTextField, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0),
            ]
        )
        
        self.myConstraints.addObjectsFromArray(
            
            self.isEnterTextMode == false ? [
                // backgroundRoundedView width 0
                NSLayoutConstraint(item: backgroundRoundedView, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 0),
                
                // addButton centered
                NSLayoutConstraint(item: addButton, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0),
                
                // inputTextField width 0
                NSLayoutConstraint(item: inputTextField, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 0)
                
                ] : [
                    
                    // backgroundRoundedView full width
                    NSLayoutConstraint(item: backgroundRoundedView, attribute: .Width, relatedBy: .Equal, toItem: self, attribute: .Width, multiplier: 1, constant: -30),
                    
                    // addButton right aligned
                    NSLayoutConstraint(item: addButton, attribute: .RightMargin, relatedBy: .Equal, toItem: self, attribute: .RightMargin, multiplier: 1, constant: -30),
                    
                    // inputTextField full width (minus addButton)
                    NSLayoutConstraint(item: inputTextField, attribute: .LeftMargin, relatedBy: .Equal, toItem: self, attribute: .LeftMargin, multiplier: 1, constant: 30),
                    NSLayoutConstraint(item: inputTextField, attribute: .RightMargin, relatedBy: .Equal, toItem: self.addButton, attribute: .LeftMargin, multiplier: 1, constant: -30),
            ]
        )
        
        self.addConstraints(self.myConstraints)
    }
    
    // user actions
    func didSelectAdd(sender: UIButton) {
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.BeginFromCurrentState, animations: {() in
            self.isEnterTextMode = true
            self.setNeedsUpdateConstraints()
            self.layoutIfNeeded()
            }, completion:nil)
        
    }
}
