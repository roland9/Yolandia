//
//  UsersTableViewController.swift
//  Yolandia
//
//  Created by Roland on 25/06/2014.
//  Copyright (c) 2014 mapps. All rights reserved.
//

import UIKit

class UsersTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    let cellIdentifier = "UserCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellIdentifier)
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return UserDataManager.users().count
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = self.tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as UITableViewCell
        assert(cell != nil, "expected cell object")
        
        let userName = UserDataManager.users()[indexPath.row] as String
        cell.textLabel.text = userName
        
        return cell
    }

}