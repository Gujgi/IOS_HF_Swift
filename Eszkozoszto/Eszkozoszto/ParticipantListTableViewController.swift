//
//  ParticipantListTableViewController.swift
//  Eszkozoszto
//
//  Created by Gujgiczer Anna on 15/12/15.
//  Copyright © 2015 Gujgiczer Anna. All rights reserved.
//

import UIKit

class ParticipantListTableViewController: UITableViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainModule.sharedInstance.participantData!.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ParticipantCell", forIndexPath: indexPath)
        //
        let participant = MainModule.sharedInstance.participantData![indexPath.row]
        cell.textLabel?.text = participant.name

        cell.detailTextLabel?.text = participant.email
        
        if cell.imageView?.image == nil, let imgURL = participant.picurl {
            cell.imageView?.image = UIImage()
            getNewsImageForCell(imgURL, cellForRowAtIndexPath: indexPath)
        }
 
        //

        return cell
    }
    
    
    //
    func getNewsImageForCell(urlString: String, cellForRowAtIndexPath indexPath: NSIndexPath) {
        var image: UIImage?
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            image =  UIImage(data: NSData(contentsOfURL: NSURL(string:urlString)!)!)
            dispatch_async(dispatch_get_main_queue()) {
                let cell = self.tableView.dequeueReusableCellWithIdentifier("ParticipantCell",forIndexPath: indexPath)
                cell.imageView?.image = image
                self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .None)
            }
        }
    }
    //
    


}
