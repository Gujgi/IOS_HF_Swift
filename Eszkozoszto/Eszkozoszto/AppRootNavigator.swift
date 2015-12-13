//
//  AppRootNavigator.swift
//  Eszkozoszto
//
//  Created by Gujgiczer Anna on 13/12/15.
//  Copyright © 2015 Gujgiczer Anna. All rights reserved.
//

import UIKit

class AppRootNavigator: NSObject, SessionEventListener
{
    static let sharedInstance = AppRootNavigator()
    
    var window: UIWindow?
    
    private var loginViewController: UIViewController?
    {
        get
        {
            return UIStoryboard(name: "Login", bundle: nil).instantiateInitialViewController()
        }
    }
    
    private var mainViewController: UIViewController?
    {
        get
        {
            return UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        }
    }
    
    override init() {
        super.init()
        
        AppSessionHandler.sharedInstance.registerSessionEventListener(self)
    }
    
    func startApplication()
    {
        window!.rootViewController = AppSessionHandler.sharedInstance.isAuthenticated ? mainViewController : loginViewController
    }
    
    // MARK: - Session event listener implementation
    func userDidLogIn(error: NSError?)
    {
        if error == nil {
            startApplication()
        }
    }
    
    func userDidLogOut(error: NSError?)
    {
        if error == nil {
            startApplication()
        }
    }
    
}
