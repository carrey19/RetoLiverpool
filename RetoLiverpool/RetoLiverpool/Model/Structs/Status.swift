//
//  Status.swift
//  RetoLiverpool
//
//  Created by Carlos Carrera Reyes on 26/12/18.
//  Copyright © 2018 Carlos Carrera Reyes. All rights reserved.
//

import ObjectMapper

struct status: Mappable {
    var status: String = ""
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        status     <- map["status"]
    }
}
