//
//  CountriesResponse.swift
//  Countries
//
//  Created by Mac OSX on 5/17/18.
//  Copyright © 2018 Mac OSX. All rights reserved.
//

import Foundation
import ObjectMapper

class CountriesResponse: NSObject, Mappable, NSCoding {
    
    required init?(coder aDecoder: NSCoder) {
        self.next = aDecoder.decodeObject(forKey: "next") as? String;
        self.countries = aDecoder.decodeObject(forKey: "countries") as? [Country];
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(next, forKey: "next")
        aCoder.encode(countries, forKey: "countries")
    }
    
    var next: String?
    var countries: [Country]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        next    <- map["next"]
        countries      <- map["countries"]
    }
}
