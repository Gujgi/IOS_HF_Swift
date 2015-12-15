//
//  MainModule.swift
//  Eszkozoszto
//
//  Created by Gujgiczer Anna on 14/12/15.
//  Copyright © 2015 Gujgiczer Anna. All rights reserved.
//

import UIKit


//MARK: - conference and participant structs
struct ConferenceEventData
{
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

struct ParticipantData
{
    var name : String!
    var email : String?
    var workplace : String?
    var hasRight : Bool!
    var machine : Int?
    var picurl : String?
    
    init(withJSON data: JSON)
    {
        //TODO: -
    }
    
    init(withName name : String, right : Bool, picurl : String?)
    {
        self.name = name
        self.hasRight = right
        self.email = "TODO"
        self.workplace = "TODO"
        self.machine = nil
        self.picurl = picurl
    }
}

class MainModule: NSObject {
    
    static let sharedInstance = MainModule()
    
    //MARK: - Conference datas
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
    
    //MARK: - Participant datas
    var participantData : [ParticipantData]?

    func getParticipantListWithCompletion(done: ((NSError?, [ParticipantData]?) -> Void))
    {
        //TODO: - get the participant list, parse into ParticipantData
        let testData = [ParticipantData(withName: "Bob", right: false, picurl: nil),
            ParticipantData(withName: "Stuart", right: false, picurl: nil),
            ParticipantData(withName: "Kevin", right: true, picurl: "https://s-media-cache-ak0.pinimg.com/736x/7d/97/33/7d973320534102e257a1583a7dd791f7.jpg")]
        //
        participantData = testData
        done(nil, testData)
    }
    
}
