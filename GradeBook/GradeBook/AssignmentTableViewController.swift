//
//  AssignmentTableViewController.swift
//  GradeBook
//
//  Created by Classroom Tech User on 3/4/15.
//  Copyright (c) 2015 Classroom Tech User. All rights reserved.
//

import UIKit

class AssignmentTableViewController: UITableViewController {
    let net = Networking()
    var term : String = ""
    var course : String = ""
    var user : String = ""
    var name : [String] = []
    var id : [String] = []
    
    
    var jsonData : JSON?
        {
        didSet {
            var i : Int = 0
            for (index, score) in jsonData!["underscores"] {
                let enroll = score["name"].stringValue
                name.insert(enroll, atIndex: i)
                
                let anId = score["id"].stringValue
                id.insert(anId, atIndex: i)
                i++
            }
            
            self.tableView?.reloadData()
        }
    }

    override func viewWillAppear(animated: Bool) {
        if net.baseUrl != nil {
            jsonData = net.getAssignments(term, course: course, user: user)
            println("\(jsonData)")
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if name.count > 0 {
            return name.count
        }
        return 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("assignmentCell", forIndexPath: indexPath) as UITableViewCell
        
        if name.count > 0 {
            cell.textLabel?.text = name[indexPath.row]
        } else {
            cell.textLabel?.text = "Could not load Assignment data"
        }
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
