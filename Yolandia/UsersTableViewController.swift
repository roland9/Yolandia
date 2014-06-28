//
//  UsersTableViewController.swift
//  Yolandia
//
//  Created by Roland on 25/06/2014.
//  Copyright (c) 2014 mapps. All rights reserved.
//

import UIKit

let kDidReceiveDataNotification = "kDidReceiveDataNotification"

class UsersTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    let cellIdentifier = "UserCell"
    var userDataManager = UserDataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellIdentifier)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didReceiveData:" as Selector, name: kDidReceiveDataNotification, object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: kDidReceiveDataNotification, object: nil)
    }
    
    // UITableView
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.userDataManager.users().count
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = self.tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as UITableViewCell
        assert(cell != nil, "expected cell object")
        
        let userName = self.userDataManager.users()[indexPath.row] as String
        cell.textLabel.text = userName
        
        return cell
    }
    
    // private - data handling
    
    func didReceiveData(notification: NSNotification) {
        self.tableView.reloadData()
    }

}