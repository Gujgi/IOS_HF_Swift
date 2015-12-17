//
//  ParticipantListTableViewController.swift
//  Eszkozoszto
//
//  Created by Gujgiczer Anna on 15/12/15.
//  Copyright © 2015 Gujgiczer Anna. All rights reserved.
//

import UIKit

class ParticipantListTableViewController: UITableViewController, UISearchResultsUpdating, ParticipantDataFetchListener
{
        
    var filteredParticipants : [ParticipantData]?
    var searchController = UISearchController(searchResultsController: nil)


    override func viewDidLoad()
    {
        super.viewDidLoad()
        MainModule.sharedInstance.registerParticipantDataFetchListener(self)
        //
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        //
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if let dataSource = filteredParticipants {
            return dataSource.count
        }
        return 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("ParticipantCell", forIndexPath: indexPath) as! ParticipantTableViewCell
        cell.participantData = filteredParticipants![indexPath.row]
        return cell
    }
    
    //MARK: - Searching
    func filterContentForSearchText(searchText: String, scope: String = "All")
    {
        if searchText.characters.count > 0
        {
            filteredParticipants = MainModule.sharedInstance.participantData!.filter
                { participant in
                    if participant.deviceId != nil
                    {
                        return participant.deviceId!.lowercaseString.containsString(searchText.lowercaseString)
                    }
                    return participant.name.lowercaseString.containsString(searchText.lowercaseString)

                }
        }
        else
        {
            filteredParticipants = MainModule.sharedInstance.participantData
        }
        tableView.reloadData()
    }
        
    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    //MARK: -
    func participantsFetched(err: NSError?)
    {
        filteredParticipants = MainModule.sharedInstance.participantData
        tableView.reloadData()
    }

    @IBAction func borrowButtonTouchUpInside(sender: UIButton)
    {
        self.performSegueWithIdentifier("qr_code_reader", sender: self)

    }

}
