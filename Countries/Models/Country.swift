//
//  Country.swift
//  Countries
//
//  Created by Mac OSX on 5/17/18.
//  Copyright © 2018 Mac OSX. All rights reserved.
//

import Foundation
import ObjectMapper

class Country: NSObject, Mappable, NSCoding {
    
    required init?(coder aDecoder: NSCoder) {
        self.name              = aDecoder.decodeObject(forKey: "name") as? String;
        self.continent         = aDecoder.decodeObject(forKey: "continent") as? String;
        self.capital           = aDecoder.decodeObject(forKey: "capital") as? String;
        self.population        = aDecoder.decodeObject(forKey: "population") as? Int;
        self.description_small = aDecoder.decodeObject(forKey: "description_small") as? String;
        self.descriptin        = aDecoder.decodeObject(forKey: "descriptin") as? String;
        self.image             = aDecoder.decodeObject(forKey: "image") as? String;
        self.country_info      = aDecoder.decodeObject(forKey: "country_info") as? CountryInfo;
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(continent, forKey: "continent")
        aCoder.encode(capital, forKey: "capital")
        aCoder.encode(population, forKey: "population")
        aCoder.encode(description_small, forKey: "description_small")
        aCoder.encode(descriptin, forKey: "descriptin")
        aCoder.encode(image, forKey: "image")
        aCoder.encode(country_info, forKey: "country_info")
    }
    
    var name: String?
    var continent: String?
    var capital: String?
    var population: Int?
    var description_small: String?
    var descriptin: String?
    var image: String?
    var country_info: CountryInfo?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name    <- map["name"]
        continent     <- map["continent"]
        capital    <- map["capital"]
        population     <- map["population"]
        description_small    <- map["description_small"]
        descriptin     <- map["description"]
        image    <- map["image"]
        country_info     <- map["country_info"]
    }
}
