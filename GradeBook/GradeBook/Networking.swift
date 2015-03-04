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
    
    func getSections() -> String {
        if (self.baseUrl? != nil) {
            let path = "?record=sections"
            
            if loader.loginWithUsername(self.userName, andPassword: self.password) {
                let data = loader.loadDataFromPath(path, error: nil)
                let dataStr = NSString(data: data, encoding: NSUTF8StringEncoding)
                
                let newData = dataStr?.dataUsingEncoding(NSUTF8StringEncoding)
                
                let json = JSON(data: newData!)
                println("\(json)")
                
                let inner = json["sections"]
                println("\(inner)")
                
                let ere = "a"
                
//                if let str = dataStr as? NSString {
//                    let json = JSON(str)
//
//                    let inner = json["sections"][0]["id"]
//                    println("\(inner)")
//                    
//                    return json
//                }
            }
        }
        return ""
    }
    
    func testConnection(user : String, password : String) -> Bool {
        if (baseUrl? != nil) {
            if loader.loginWithUsername(user, andPassword: password) {
                return true
            }
        }
        return false
    }
    
    
    
}


//            let data = loader.loadDataFromPath("?record=enrollments&term=2002&course=999", error: nil)