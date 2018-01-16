//
//  Album.swift
//  LastFM
//
//  Created by Sharon Chetrit on 01/01/2018.
//  Copyright © 2018 Sharon Chetrit. All rights reserved.
//

import UIKit

class Album: Artist
{
    var artist : Artist?
    var tags : [Tag]?
    var tracks : [Track]?
    var largeImageUrl : URL?
    
    func parseDetail(dict : [String : Any])
    {
        if let imageDictArray : [[String : Any]] = dict["image"] as? [[String : Any]]
        {
            for imageDict : [String : Any] in imageDictArray
            {
                if imageDict["size"] as? String == "large"
                {
                    if let largeUrlString : String = imageDict["#text"] as? String
                    {
                        self.largeImageUrl = URL(string: largeUrlString)
                        break
                    }
                }
                
                if let toptags : [String : Any] = dict["toptags"] as? [String : Any]
                {
                    if let tagDicts : [[String : Any]] = toptags["tag"] as? [[String : Any]]
                    {
                        var tags : [Tag] = []
                        
                        for tagDict : [String : Any] in tagDicts
                        {
                            let tag : Tag = Tag(dict: tagDict)
                            tags.append(tag)
                        }
                        
                        self.tags = tags
                    }
                }
                
                if let tracks : [String : Any] = dict["tracks"] as? [String : Any]
                {
                    if let trackDicts : [[String : Any]] = tracks["track"] as? [[String : Any]]
                    {
                        var tracks : [Track] = []
                        
                        for tagDict : [String : Any] in trackDicts
                        {
                            let track : Track = Track(dict: tagDict)
                            tracks.append(track)
                        }
                        
                        self.tracks = tracks
                    }
                }
            }
        }
    }
}
