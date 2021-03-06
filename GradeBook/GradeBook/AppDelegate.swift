//
//  AppDelegate.swift
//  GradeBook
//
//  Created by Classroom Tech User on 2/26/15.
//  Copyright (c) 2015 Classroom Tech User. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.

        let (d0, e2) = Locksmith.loadDataForUserAccount("gbUserName")
        let (d1, e3) = Locksmith.loadDataForUserAccount("gbPassword")
        
        let d2 = d0?["userName"] as? String
        let d3 = d1?["password"] as? String

        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            if let newRoot = window?.rootViewController?.storyboard?.instantiateViewControllerWithIdentifier("iPadMain") as? UISplitViewController {
                window?.rootViewController = newRoot
                if let navVc = newRoot.viewControllers[0] as? UINavigationController {

                    
                }
            }
        }
        else {
            if let loginVC = window?.rootViewController as? LoginViewController {
                if d0?.count == 1 && d1?.count == 1 {
                    loginVC.usr = d2?
                    loginVC.psw = d3?
                }

            }
        }
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

