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
        let cell = tableView.dequeueReusableCellWithIdentifier("sectionCell", forIndexPath: indexPath) as SectionTableViewCell
        
        if let data = self.jsonData?["sections"].array? {
            cell.textLabel?.text = data[indexPath.row]["title"].stringValue
            cell.course = data[indexPath.row]["course"].stringValue
            cell.term = data[indexPath.row]["term"].stringValue
        }        

        return cell
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
        if segue.identifier == "enrollment" {
            if let enrollVC = segue.destinationViewController as? EnrollmentTableViewController {
                if let cell = sender? as? SectionTableViewCell {
                    enrollVC.net.baseUrl = net.baseUrl
                    enrollVC.net.userName = net.userName
                    enrollVC.net.password = net.password
                    
                    enrollVC.course = cell.course
                    enrollVC.term = cell.term
                }
                
            }
        }
    }

}




