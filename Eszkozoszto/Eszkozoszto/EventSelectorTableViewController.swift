//
//  EventSelectorTableViewController.swift
//  Eszkozoszto
//
//  Created by Gujgiczer Anna on 14/12/15.
//  Copyright © 2015 Gujgiczer Anna. All rights reserved.
//

import UIKit

class EventSelectorTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainModule.sharedInstance.eventData!.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ConferenceCell", forIndexPath: indexPath)
        let eventName = MainModule.sharedInstance.eventData![indexPath.row].name
        // Configure the cell...
        cell.textLabel?.text = eventName
        

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        MainModule.sharedInstance.selectedEvent = MainModule.sharedInstance.eventData![indexPath.row]
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
