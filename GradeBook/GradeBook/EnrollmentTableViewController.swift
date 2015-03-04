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
    
    var jsonData : JSON?
        {
        didSet {
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
    }

    override func viewWillAppear(animated: Bool) {
        if net.baseUrl != nil {
            jsonData = net.getEnrollments(term, course: course)
            println("\(jsonData)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("enrollCell", forIndexPath: indexPath) as UITableViewCell

        cell.textLabel?.text = name[indexPath.row]
        cell.detailTextLabel?.text = id[indexPath.row]
    
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
