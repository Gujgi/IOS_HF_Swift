//
//  MainViewController.swift
//  Eszkozoszto
//
//  Created by Gujgiczer Anna on 15/12/15.
//  Copyright © 2015 Gujgiczer Anna. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        MainModule.sharedInstance.getEventsListWithCompletion{ (err: NSError?,data: [ConferenceEventData]?) -> Void in
            if let eventData = data where err == nil {
                if eventData.count > 1 {
                    self.performSegueWithIdentifier("retek", sender: self)
                }
            }
        }
    }
    
    //MARK: - Actions
    
}
