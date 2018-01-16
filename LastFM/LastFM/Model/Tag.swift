//
//  Tag.swift
//  LastFM
//
//  Created by Sharon Chetrit on 01/01/2018.
//  Copyright © 2018 Sharon Chetrit. All rights reserved.
//

import UIKit

class Tag: NSObject
{
    var name : String?
    var url : URL?
    
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
    }
}
