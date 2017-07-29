//
//  Patient.swift
//  Famidesk
//
//  Created by Mathias Biard on 29/07/2017.
//  Copyright © 2017 CodingOwl. All rights reserved.
//

import Foundation

class Patient: NSObject {
    
    var name: String?
    var birth_date: Date?
    var age: Int?
    var picture_url: URL?
    
    
    
    init(json: Any) {
        if let json = json as? [String: Any] {
            self.name = json["name"] as? String
            self.birth_date = Date.stringToDate(stringDate: json["birth_date"] as? String)
            self.age = json["age"] as? Int
            self.picture_url = URL(string: json["picture_url"] as? String ?? "")
        }
    }
}
