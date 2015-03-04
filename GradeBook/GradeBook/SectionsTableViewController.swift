//
//  SectionsTableViewController.swift
//  GradeBook
//
//  Created by Classroom Tech User on 3/3/15.
//  Copyright (c) 2015 Classroom Tech User. All rights reserved.
//

import UIKit

class SectionsTableViewController: UITableViewController {
    let net = Networking()

    var jsonData : JSON?
    {
        didSet {
            self.tableView?.reloadData()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        if net.baseUrl != nil {
            jsonData = net.getSections()
        }

    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = self.jsonData?["sections"].array? {
            return sections.count
        }
        return 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("sectionCell", forIndexPath: indexPath) as UITableViewCell
        
        if let data = self.jsonData?["sections"].array? {
            cell.textLabel?.text = data[indexPath.row]["title"].stringValue
        }        

        return cell
    }
}
