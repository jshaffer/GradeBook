//
//  EnrollmentTableViewController.swift
//  GradeBook
//
//  Created by Classroom Tech User on 3/4/15.
//  Copyright (c) 2015 Classroom Tech User. All rights reserved.
//

import UIKit

class EnrollmentTableViewController: UITableViewController {
    var name : [String] = []
    var id : [String] = []
    var term : String = ""
    var course : String = ""
    
    let net = Networking()
    
    var jsonData : JSON? {
        didSet {
            name.removeAll(keepCapacity: true)
            id.removeAll(keepCapacity: true)
            
            var i : Int = 0
            for (index, enrollment) in jsonData!["enrollments"] {
                let enroll = enrollment["first_name"].stringValue + enrollment["last_name"].stringValue
                name.insert(enroll, atIndex: i)
                
                let anId = enrollment["id"].stringValue
                id.insert(anId, atIndex: i)
                i++
            }
                
            self.tableView?.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.topItem?.title = "Enrollment"
    }
    
    override func viewWillAppear(animated: Bool) {
        if net.baseUrl != nil {
            jsonData = net.getEnrollments(term, course: course)
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("enrollCell", forIndexPath: indexPath) as EnrollmentTableViewCell

        cell.textLabel?.text = name[indexPath.row]
        cell.detailTextLabel?.text = id[indexPath.row]
        
        cell.user = self.net.userName!
        cell.term = self.term
        cell.course = self.course
        
    
        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "assignment" {
            if let assignVC = segue.destinationViewController as? AssignmentTableViewController {
                if let cell = sender as? EnrollmentTableViewCell {
                    assignVC.net.baseUrl = net.baseUrl
                    assignVC.net.userName = net.userName
                    assignVC.net.password = net.password
                    
                    assignVC.course = cell.course
                    assignVC.user = cell.user
                    assignVC.term = cell.term
                }
            }
        }
    }


}
