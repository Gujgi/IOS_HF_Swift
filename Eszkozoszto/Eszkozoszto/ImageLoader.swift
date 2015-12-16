//
//  ImageLoader.swift
//  Eszkozoszto
//
//  Created by Gujgiczer Anna on 15/12/15.
//  Copyright © 2015 Gujgiczer Anna. All rights reserved.
//

import UIKit

class ImageLoader: NSObject {

    
    static func getImage(withUrlString urlString: String, done: ((NSError?, UIImage?) -> Void))
    {
        var image: UIImage?
        if let imageData = NSUserDefaults.standardUserDefaults().objectForKey(urlString) as? NSData
        {
            image =  UIImage(data: imageData)
            dispatch_async(dispatch_get_main_queue()) {
                done(nil, image)
            }
            return
        }
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            if let imgData = NSData(contentsOfURL: NSURL(string:urlString)!)
            {
                image =  UIImage(data: imgData)
                
                //Cache
                let imageData = UIImagePNGRepresentation(image!)
                NSUserDefaults.standardUserDefaults().setObject(imageData, forKey: urlString)
                //
                dispatch_async(dispatch_get_main_queue()) {
                    done(nil, image)
                }
            }
            else
            {
                done(NSError(domain: "image error", code: 10, userInfo: nil), image)
            }
        }
    }
}
