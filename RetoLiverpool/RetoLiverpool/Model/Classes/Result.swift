//
//  Search.swift
//  RetoLiverpool
//
//  Created by Carlos Carrera Reyes on 25/12/18.
//  Copyright © 2018 Carlos Carrera Reyes. All rights reserved.
//

import ObjectMapper


class Result:Mappable{
    var plpResults:plpResult!
    var status: status!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        plpResults  <- map["plpResults"]
        status      <- map["status"]
    }
}
