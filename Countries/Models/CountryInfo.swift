//
//  CountryInfo.swift
//  Countries
//
//  Created by Mac OSX on 5/17/18.
//  Copyright © 2018 Mac OSX. All rights reserved.
//

import Foundation
import ObjectMapper

class CountryInfo: NSObject, Mappable, NSCoding {
    
    required init?(coder aDecoder: NSCoder) {
        self.images = aDecoder.decodeObject(forKey: "images") as? [String];
        self.flag = aDecoder.decodeObject(forKey: "flag") as? String;
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(images, forKey: "images")
        aCoder.encode(flag, forKey: "flag")
    }
    
    var images: [String]?
    var flag: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        images    <- map["images"]
        flag      <- map["flag"]
    }
}
