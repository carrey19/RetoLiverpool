//
//  Product.swift
//  RetoLiverpool
//
//  Created by Carlos Carrera Reyes on 26/12/18.
//  Copyright © 2018 Carlos Carrera Reyes. All rights reserved.
//

import ObjectMapper

struct Product: Mappable{
    var title: String = ""
    var price: Int = 0
    var imageP: String = ""
    
    init?(map: Map) {
        // Validate your JSON here: check for required properties, etc
    }
    
    mutating func mapping(map: Map) {
        title  <- map["productDisplayName"]
        price   <- map["listPrice"]
        imageP  <- map["smImage"]
    }
}
