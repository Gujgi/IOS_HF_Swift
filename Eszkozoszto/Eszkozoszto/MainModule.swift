//
//  MainModule.swift
//  Eszkozoszto
//
//  Created by Gujgiczer Anna on 14/12/15.
//  Copyright © 2015 Gujgiczer Anna. All rights reserved.
//

import UIKit

struct ConferenceEventData {
    var name : String!
    var id : String!
    //TODO: - expand if needed
    var place : String!
    
    init(withJSON data: JSON)
    {
        //TODO: -
    }
    
    init(withName name : String)
    {
        self.name = name
        self.id = "TODO"
        self.place = "TODO"
    }
}

class MainModule: NSObject {
    
    static let sharedInstance = MainModule()
    
    var eventData : [ConferenceEventData]? {
        didSet {
            if let data = eventData where eventData?.count == 1 {
                selectedEvent = data.first
            }
        }
    }
    var selectedEvent : ConferenceEventData? {
        didSet {
            loadGuestData()
        }
    }
    
    func getEventsListWithCompletion(done: ((NSError?, [ConferenceEventData]?) -> Void)) {
        
        //TODO: - get the events list, parse into ConferenceEventData
        let testData = [ConferenceEventData(withName: "János egy sith lovag leleplezése"),
            ConferenceEventData(withName: "Károly a triceratropsz elesik")]
        //
        eventData = testData
        done(nil, testData)
    }
    
    func loadGuestData() {
        
    }

}
