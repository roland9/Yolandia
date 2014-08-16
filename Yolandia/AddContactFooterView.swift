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
        button.titleLabel.font = UIFont(name: "Avenir", size: 32)
        button.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        button.setTitle("+", forState: UIControlState.Normal)
        button.backgroundColor = UIColor.greenColor()
        button.layer.cornerRadius = 22
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

// why is this required?!?
    override init(frame: CGRect) {
		super.init(frame: frame)
    }

	override init(reuseIdentifier: String!) {
        super.init(reuseIdentifier: reuseIdentifier)

        self.addSubview(backgroundRoundedView)
        self.addSubview(inputTextField)
        self.addSubview(addButton)

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

// backgroundRoundedView
        self.addConstraint(NSLayoutConstraint(item: backgroundRoundedView, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 300))
        self.addConstraint(NSLayoutConstraint(item: backgroundRoundedView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 50))
        self.addConstraint(NSLayoutConstraint(item: backgroundRoundedView, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: backgroundRoundedView, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0))

// addButton
        self.addConstraint(NSLayoutConstraint(item: addButton, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 44))
        self.addConstraint(NSLayoutConstraint(item: addButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 44))
        self.addConstraint(NSLayoutConstraint(item: addButton, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: addButton, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0))

// inputTextField
        self.addConstraint(NSLayoutConstraint(item: inputTextField, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 2))
        self.addConstraint(NSLayoutConstraint(item: inputTextField, attribute: .Height, relatedBy: .Equal, toItem: addButton, attribute: .Height, multiplier: 1, constant: -10))
        self.addConstraint(NSLayoutConstraint(item: inputTextField, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: -60))
        self.addConstraint(NSLayoutConstraint(item: inputTextField, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0))
    }
    
     required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
