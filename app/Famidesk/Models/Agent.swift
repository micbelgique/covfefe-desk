//
//  Agent.swift
//  Famidesk
//
//  Created by Mathias Biard on 29/07/2017.
//  Copyright © 2017 CodingOwl. All rights reserved.
//

import Foundation

class Agent: NSObject {
    
    var name: String?
    var picture_url: URL?
    
    init(json: Any) {
        if let json = json as? [String: Any] {
            self.name = json["name"] as? String
            self.picture_url = URL(string: json["picture_url"] as? String ?? "")
        }
    }
}
