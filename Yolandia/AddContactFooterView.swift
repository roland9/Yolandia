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
        return button
    }()
	
    lazy var userInput: UITextField = {
        let input = UITextField()
return input
    }()

// why is this required?!?
    override init(frame: CGRect) {
		super.init(frame: frame)
    }

	override init(reuseIdentifier: String!) {
        super.init(reuseIdentifier: reuseIdentifier)

        self.addSubview(addButton)
        
        let views = [
            "addButton": addButton,
        ]

        let metrics = [
            "margin": 12,
            "leftMargin": 16,
            "lineMargin": 14
        ]

        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-[addButton(>=200)]-|", options: nil, metrics: metrics, views: views))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-(margin)-[addButton]-(margin)-|", options: nil, metrics: metrics, views: views))
//        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[lineView]|", options: nil, metrics: metrics, views: views))
//        contentView.addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .CenterY, relatedBy: .Equal, toItem: timeLabel, attribute: .CenterY, multiplier: 1, constant: 0))
//        contentView.addConstraint(NSLayoutConstraint(item: circleView, attribute: .CenterX, relatedBy: .Equal, toItem: lineView, attribute: .CenterX, multiplier: 1, constant: 0))
//        contentView.addConstraint(NSLayoutConstraint(item: circleView, attribute: .CenterY, relatedBy: .Equal, toItem: titleLabel, attribute: .CenterY, multiplier: 1, constant: 0))
//        contentView.addConstraint(NSLayoutConstraint(item: circleView, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 14))
//        contentView.addConstraint(NSLayoutConstraint(item: circleView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 14))
    }
    
 required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
