//
//  ParticipantTableViewCell.swift
//  Eszkozoszto
//
//  Created by Gujgiczer Anna on 15/12/15.
//  Copyright © 2015 Gujgiczer Anna. All rights reserved.
//

import UIKit

class ParticipantTableViewCell: UITableViewCell {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var participantImageView: UIImageView!
    @IBOutlet weak var deviceIDLabel: UILabel!
    @IBOutlet weak var borrowButton: UIButton!
    @IBOutlet weak var returnButton: UIButton!
    
    var participantData : ParticipantData?
    {
        didSet
        {
            if let data = participantData
            {
                nameLabel.text = data.name
                emailLabel.text = data.email
                deviceIDLabel.text = data.deviceId
                borrowButton.enabled = (data.deviceId == nil) && data.hasRight!
                returnButton.enabled = !(data.deviceId == nil)

            
                if let imgURL = data.picurl
                {
                    ImageLoader.getImage(withUrlString: imgURL, done: { (err: NSError?,image: UIImage?) -> Void in
                        if err == nil {
                            self.participantImageView.image = image!
                        }
                    })
                }
                else
                {
                    self.participantImageView.image = nil
                }
            }
        }
    }
    
    @IBAction func borrowButtonTouchUpInside(sender: UIButton)
    {
        MainModule.sharedInstance.selectedParticipant = participantData
    }
    @IBAction func returnButtonTouchUpInside(sender: AnyObject)
    {
        MainModule.sharedInstance.selectedParticipant = participantData
        MainModule.sharedInstance.selectedParticipant?.deviceId = nil
        MainModule.sharedInstance.saveBorrowProcess()
    }

}
