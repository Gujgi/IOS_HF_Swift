//
//  LoginViewController.swift
//  Eszkozoszto
//
//  Created by Gujgiczer Anna on 13/12/15.
//  Copyright © 2015 Gujgiczer Anna. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, SessionEventListener
{
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //MARK: - Actions
    @IBAction func loginButtonTouchUpInside(sender: AnyObject)
    {
        AppSessionHandler.sharedInstance.logIn(withUserName: usernameField.text, password: passwordField.text)
    }
    
    func userDidLogIn(error: NSError?)
    {
        if error != nil {
            errorLabel.text = "Wrong username or password"
            errorLabel.hidden = true
        }
    }
    
    func userDidLogOut(error: NSError?)
    {

    }
}
