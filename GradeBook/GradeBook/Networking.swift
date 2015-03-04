//
//  Networking.swift
//  GradeBook
//
//  Created by Classroom Tech User on 3/3/15.
//  Copyright (c) 2015 Classroom Tech User. All rights reserved.
//

import Foundation

class Networking {
    let loader = GradebookURLLoader()
    
    var baseUrl : String? {
        didSet {
            if baseUrl != "" {
                self.loader.baseURL = baseUrl
            } else {
                baseUrl = nil
            }
        }
    }
    var userName : String?
    var password : String?
    
    
    init() {
        
    }
    
    init(_ base : String) {
        self.baseUrl = base
    }
    
    init(_ base : String, usr : String, psw : String) {
        self.baseUrl = base
        self.userName = usr
        self.password = psw
    }
    
    func getSections() -> JSON? {
        if (self.baseUrl? != nil && self.userName != "") {
            let path = "?record=sections"
            
            if loader.loginWithUsername(self.userName, andPassword: self.password) {
                let data = loader.loadDataFromPath(path, error: nil)
                let dataStr = NSString(data: data, encoding: NSUTF8StringEncoding)
                
                let newData = dataStr?.dataUsingEncoding(NSUTF8StringEncoding)
                
                let json = JSON(data: newData!)
                return json
            }
        }
        return nil
    }
    
    func getEnrollments(term : String, course : String) -> JSON? {
        if (self.baseUrl? != nil && self.userName != "") {
            let path = "?record=enrollments&term=" + term + "&course=" + course
            
            if loader.loginWithUsername(self.userName, andPassword: self.password) {
                let data = loader.loadDataFromPath(path, error: nil)
                let dataStr = NSString(data: data, encoding: NSUTF8StringEncoding)
                
                let newData = dataStr?.dataUsingEncoding(NSUTF8StringEncoding)
                
                let json = JSON(data: newData!)
                return json
            }
        }
        return nil
    }
    
    func getAssignments(term : String, course : String, user : String) -> JSON? {
        if (self.baseUrl? != nil && self.userName != "") {
            let path = "?record=underscores&term=" + term + "&course=" + course + "&user=" + user
            
            if loader.loginWithUsername(self.userName, andPassword: self.password) {
                let data = loader.loadDataFromPath(path, error: nil)
                let dataStr = NSString(data: data, encoding: NSUTF8StringEncoding)
                
                let newData = dataStr?.dataUsingEncoding(NSUTF8StringEncoding)
                
                let json = JSON(data: newData!)
                return json
            }
        }
        return nil
    }
    
//    func testConnection(user : String, password : String) -> Bool {
//        if (baseUrl? != nil) {
//            if loader.loginWithUsername(user, andPassword: password) {
//                return true
//            }
//        }
//        return false
//    }    
}