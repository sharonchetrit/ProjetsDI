//
//  Track.swift
//  LastFM
//
//  Created by Sharon Chetrit on 01/01/2018.
//  Copyright © 2018 Sharon Chetrit. All rights reserved.
//

import UIKit

class Track: NSObject
{
    var name : String?
    var duration : String?
    var url : URL?
    var rank : Int?
    
    init(dict: [String:Any] )
    {
        if let name : String = dict["name"] as? String
        {
            self.name = name
        }
        
        if let urlString : String = dict["url"] as? String
        {
            self.url = URL(string: urlString)
        }
        
        if let rawDuration : Int = Int(dict["duration"] as! String)
        {
            let minutes : Int = rawDuration / 60
            let seconds : Int = rawDuration % 60
            
            if seconds >= 10 // checking for double digit values
            {
                self.duration = "\(minutes):\(seconds)"
            }
            else
            {
                self.duration = "\(minutes):0\(seconds)"
            }
        }
        
        if let attr : [String : Any] = dict["@attr"] as? [String : Any]
        {
            if let rank : Int = Int(attr["rank"] as! String)
            {
                self.rank = rank
            }
        }
    }
}
