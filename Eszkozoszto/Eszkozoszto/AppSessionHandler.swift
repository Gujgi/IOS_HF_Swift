//
//  AppSectionHandler.swift
//  Eszkozoszto
//
//  Created by Gujgiczer Anna on 13/12/15.
//  Copyright © 2015 Gujgiczer Anna. All rights reserved.
//

import UIKit

protocol SessionEventListener
{
    func userDidLogIn(error: NSError?)
    func userDidLogOut(error: NSError?)
}

class AppSessionHandler: NSObject
{
    static let sharedInstance = AppSessionHandler()
    
    //MARK: - User session data
    var accessToken : String? {
        get {
            if let token = NSUserDefaults.standardUserDefaults().objectForKey("API.accessToken") as! String? {
                return token
            }
            else {
                return nil
            }
        }
        
        set (value) {
            NSUserDefaults.standardUserDefaults().setObject(value, forKey: "API.accessToken")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    var userId : String? {
        get {
            if let id = NSUserDefaults.standardUserDefaults().objectForKey("API.userId") as! String? {
                return id
            }
            else {
                return nil
            }
        }
        
        set (value) {
            NSUserDefaults.standardUserDefaults().setObject(value, forKey: "API.userId")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    var isAuthenticated : Bool {
        get {
            return accessToken != nil
        }
    }
    
    //MAKR: - Public methods
    func logIn(withUserName name: String!, password: String!)
    {
        //TODO: -
        /*
        - Call api
        - save userId and accesstoken
        */
        userId = "TODO"
        accessToken = "TODO"
        sessionEventListeners.forEach { (listener) in
            listener.userDidLogIn(nil)
        }
    }
    
    func logOut()
    {
        //TODO: -
        /*
        - Call api
        */
        userId = nil
        accessToken = nil
        sessionEventListeners.forEach { (listener) in
            listener.userDidLogOut(nil)
        }
    }
    
    //MARK: - Session event listeners
    private lazy var sessionEventListeners: Array<SessionEventListener> =
    {
        return Array<SessionEventListener>()
    }()
    
    func registerSessionEventListener(listener :SessionEventListener)
    {
        sessionEventListeners.append(listener)
    }

}
