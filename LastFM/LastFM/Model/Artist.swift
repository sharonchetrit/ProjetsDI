//
//  Artist.swift
//  LastFM
//
//  Created by Sharon Chetrit on 01/01/2018.
//  Copyright © 2018 Sharon Chetrit. All rights reserved.
//

import UIKit

class Artist: NSObject
{
    var mbid:String?
    var name:String?
    var listeners:String?
    var smallImageUrl:URL?
    
    init(dict: [String:Any] )
    {
        if let name : String = dict["name"] as? String
        {
            self.name = name
        }
        
        if let mbid : String = dict["mbid"] as? String
        {
            self.mbid = mbid
        }
        
        if let listeners = dict["listeners"] as? String
        {
            self.listeners = listeners
        }
        
        if let imageDictArray : [[String : String]] = dict["image"] as? [[String : String]]
        {
            for imageDict : [String : String] in imageDictArray
            {
                if imageDict["size"] == "small"
                {
                    if let smallUrlString : String = imageDict["#text"]
                    {
                        self.smallImageUrl = URL(string: smallUrlString)
                        break
                    }
                    
                }
            }
        }
    }
}
