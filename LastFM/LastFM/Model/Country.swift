//
//  Country.swift
//  LastFM
//
//  Created by Sharon Chetrit on 01/01/2018.
//  Copyright © 2018 Sharon Chetrit. All rights reserved.
//

import UIKit

class Country: NSObject
{
    var flag : String
    var name : String
    var urlName : String
    
    init( flag: String, name : String, urlName : String)
    {
        self.flag = flag
        self.name = name
        self.urlName = urlName
    }
    
    static func defaultCountries() -> [Country]
    {
        var countries : [Country] = []
                
        countries.append(Country(flag: "🇮🇱", name: "Israel", urlName: "israel"))
        countries.append(Country(flag: "🇺🇸", name: "United States", urlName: "united%20states"))
        countries.append(Country(flag: "🇬🇧", name: "United Kingdom", urlName: "united%20kingdom"))
        countries.append(Country(flag: "🇨🇭", name: "Switzerland", urlName: "switzerland"))
        countries.append(Country(flag: "🇨🇦", name: "Canada", urlName: "canada"))
        
        return countries
    }
}
