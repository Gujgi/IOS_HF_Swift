//
//  ParticipantTableViewCell.swift
//  Eszkozoszto
//
//  Created by Gujgiczer Anna on 15/12/15.
//  Copyright © 2015 Gujgiczer Anna. All rights reserved.
//

import UIKit

class ParticipantTableViewCell: UITableViewCell {

    @IBOutlet weak var workplaceLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var participantImageView: UIImageView!
    @IBOutlet weak var borrowButton: UIButton!
    
    var participantData : ParticipantData?
    {
        didSet
        {
            if let data = participantData
            {
                nameLabel.text = data.name
                emailLabel.text = data.email
                workplaceLabel.text = data.workplace
                borrowButton.enabled = (data.deviceId == nil) && data.hasRight!

            
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

}
