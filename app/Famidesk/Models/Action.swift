//
//  Action.swift
//  Famidesk
//
//  Created by Mathias Biard on 29/07/2017.
//  Copyright © 2017 CodingOwl. All rights reserved.
//

import Foundation

class Action: NSObject {
    
    var id: Int?
    var name: String?
    var datetime: Date? // "2017-07-29T07:28:23.000Z",
    var type: String?
    //var agent: Agent?
    
    init(json: Any) {
        if let json = json as? [String: Any] {
            self.id = json["id"] as? Int
            self.name = json["name"] as? String
            self.datetime = Date.stringToDate(stringDate: json["datetime"] as? String) // TODO Parsing correcte
            self.type = json["type"] as? String
        }
    }
}

