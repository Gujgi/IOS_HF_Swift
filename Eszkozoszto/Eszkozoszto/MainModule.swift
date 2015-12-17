//
//  MainModule.swift
//  Eszkozoszto
//
//  Created by Gujgiczer Anna on 14/12/15.
//  Copyright © 2015 Gujgiczer Anna. All rights reserved.
//

import UIKit

protocol ParticipantDataFetchListener
{
    func participantsFetched(err: NSError?)
}


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
    var id : String!
    var name : String!
    var email : String?
    var workplace : String?
    var hasRight : Bool!
    var deviceId : String?
    var picurl : String?
    
    init(withJSON data: JSON)
    {
        //TODO: -
    }
    
    init(withName name : String, right : Bool, picurl : String?, email : String?)
    {
        self.id = name
        self.name = name
        self.hasRight = right
        self.email = email
        self.workplace = "TODO"
        self.deviceId = nil
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
            fetchParticipantList()
        }
    }
    
    func getEventsListWithCompletion(done: ((NSError?, [ConferenceEventData]?) -> Void)) {
        
        //TODO: - get the events list, parse into ConferenceEventData
        let testData = [ConferenceEventData(withName: "Conference 1"),
            ConferenceEventData(withName: "Conference 2"),
            ConferenceEventData(withName: "Conference 3"),
            ConferenceEventData(withName: "Conference 4"),
            ConferenceEventData(withName: "Conference 5")]
        //
        eventData = testData
        done(nil, testData)
    }
    
    
    //MARK: - Dataloading event listeners
    private lazy var ParticipantDataFetchListeners: Array<ParticipantDataFetchListener> =
    {
        return Array<ParticipantDataFetchListener>()
    }()
    
    func registerParticipantDataFetchListener(listener :ParticipantDataFetchListener)
    {
        ParticipantDataFetchListeners.append(listener)
    }
    
    //MARK: - Participant datas
    var participantData : [ParticipantData]?
    {
        didSet
        {
            ParticipantDataFetchListeners.forEach { (listener) in
                listener.participantsFetched(nil)
            }
        }
    }
    
    var selectedParticipant: ParticipantData?

    func fetchParticipantList()
    {
        //TODO: - get the participant list, parse into ParticipantData
        let testData = [ParticipantData(withName: "Bob", right: false, picurl: "https://cdn2.iconfinder.com/data/icons/despicable-me-2-minions/128/Minion-reading-icon.png", email: "bob@gmail.com"),
            ParticipantData(withName: "Stuart", right: false, picurl: "https://yt3.ggpht.com/-C2UPftnYDQk/AAAAAAAAAAI/AAAAAAAAAAA/AGSr55zL_Rg/s900-c-k-no/photo.jpg", email: nil),
            ParticipantData(withName: "Kevin", right: true, picurl: "https://s-media-cache-ak0.pinimg.com/736x/7d/97/33/7d973320534102e257a1583a7dd791f7.jpg", email: "kevin@gmail.com"),
            ParticipantData(withName: "Dave", right: true, picurl: "https://cdn2.iconfinder.com/data/icons/despicable-me-2-minions/128/superman-minion-icon.png", email: "dave@gmail.com"),
            ParticipantData(withName: "Jerry", right: true, picurl: "https://s-media-cache-ak0.pinimg.com/736x/29/39/00/2939002bbe6d787c7a2f38cc8ebad84f.jpg", email: nil),
            ParticipantData(withName: "Jorge", right: false, picurl: "https://media.licdn.com/mpr/mpr/shrinknp_800_800/AAEAAQAAAAAAAAJpAAAAJGIyODZjZDI5LWVkODEtNDIwMC1hMjAwLWVlNDg4MmYxYmE3Mg.jpg", email: "jorge@gmail.com"),
            ParticipantData(withName: "Tim", right: true, picurl: "https://cdn2.iconfinder.com/data/icons/despicable-me-2-minions/128/despicable-me-2-Minion-icon-1.png", email: "tim@yahoo.com"),
            ParticipantData(withName: "Mark", right: false, picurl: "https://33.media.tumblr.com/avatar_8d5fdc9782c8_128.png", email: "mark@gmail.com"),
            ParticipantData(withName: "Jon", right: true, picurl: "https://33.media.tumblr.com/avatar_c4f4a4858f16_128.png", email: "jon@gmail.com")]
        //
        participantData = testData
    }
    
    func saveBorrowProcess() {
        var targetIndex = -1
        participantData?.enumerate().forEach({ (index, data) -> () in
            if data.id == selectedParticipant!.id {
                targetIndex = index
            }
        })
        participantData?[targetIndex].deviceId = selectedParticipant?.deviceId
        selectedParticipant = nil
    }
}
