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
    @IBOutlet weak var savePassword: UISwitch!
    
    var usr : String?
    var psw : String?
    
    override func viewDidLoad() {
        let (d0, e0) = Locksmith.loadDataForUserAccount("gbUserName")
        let (d1, e1) = Locksmith.loadDataForUserAccount("gbPassword")
        
        if d0?.count == 1 {
            let usr = d0?["userName"] as? String
            userName.text = usr
        } else if userName != nil {
            userName.text = usr?
        }
            
        if d1?.count == 1 {
            let psw = d1?["password"] as? String
            password.text = psw
        } else if password != nil {
            password.text = psw?
        }
    }
    
    @IBAction func login(sender: AnyObject) {
        let e0 = Locksmith.deleteDataForUserAccount("gbUserName")
        let e1 = Locksmith.deleteDataForUserAccount("gbPassword")
        
        if savePassword.on {
            let e0 = Locksmith.saveData(["userName": userName.text], forUserAccount: "gbUserName")
            let e1 = Locksmith.saveData(["password": password.text], forUserAccount: "gbPassword")
        }
        
        self.performSegueWithIdentifier("login", sender: self)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        //still check the segue and pass data
        if segue.identifier == "login" {
            if let navVC = segue.destinationViewController as? UINavigationController {
                if let sectionsVC = navVC.viewControllers[0] as? SectionsTableViewController {
                    sectionsVC.net.baseUrl = baseUrl.text
                    sectionsVC.net.userName = userName.text
                    sectionsVC.net.password = password.text
                }

            }
        }
    }


}
