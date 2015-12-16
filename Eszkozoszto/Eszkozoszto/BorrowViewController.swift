//
//  BorrowViewController.swift
//  Eszkozoszto
//
//  Created by Gujgiczer Anna on 16/12/15.
//  Copyright © 2015 Gujgiczer Anna. All rights reserved.
//

import UIKit
import AVFoundation



class BorrowViewController: UIViewController, QRReaderDelegate
{

    @IBOutlet weak var deviceIDField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: _ QRReader methods
    func didReadQRCode(code: String?)
    {
        deviceIDField.text = code
    }

    //MARK: - Actions
    @IBAction func okButtonTouchUpInside(sender: UIButton)
    {
        MainModule.sharedInstance.selectedParticipant?.deviceId = deviceIDField.text
        MainModule.sharedInstance.saveBorrowProcess()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let id = segue.identifier {
            switch id {
            case "QR_reader_embed":
                (segue.destinationViewController as! QRCodeReaderViewController).delegate = self
                break
            default:
                break
            }
        }
    }
}
