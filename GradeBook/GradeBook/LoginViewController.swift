//
//  LoginViewController.swift
//  GradeBook
//
//  Created by Classroom Tech User on 3/3/15.
//  Copyright (c) 2015 Classroom Tech User. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var baseUrl: UITextField!
    
    
    @IBAction func login(sender: AnyObject) {
        println("\(userName.text)")
        println("\(password.text)")
        println("\(baseUrl.text)")
        
        self.performSegueWithIdentifier("login", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

//    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
//        let net = Networking(baseUrl.text)
//        
//        if identifier == "login" && net.testConnection(userName.text, password: password.text) {
//            return true
//        } else {
//            return false
//        }
//        
//    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        //still check the segue and pass data
        if segue.identifier == "login" {
            if let navVC = segue.destinationViewController as? UINavigationController {
                if let sectionsVC = navVC.viewControllers[0] as? SectionsTableViewController {
                    println("hello")
                    sectionsVC.net.baseUrl = baseUrl.text
                    sectionsVC.net.userName = userName.text
                    sectionsVC.net.password = password.text
                    
                    sectionsVC.jsonData = sectionsVC.net.getSections()
                }

            }
        }
    }


}
