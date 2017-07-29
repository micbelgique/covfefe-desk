
//
//  DateExtensions.swift
//  Famidesk
//
//  Created by Mathias Biard on 29/07/2017.
//  Copyright © 2017 CodingOwl. All rights reserved.
//

import Foundation

extension Date {
    static func stringToDate(stringDate: String?) -> Date? {
        guard let stringDate = stringDate else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd" //Your date format
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+1:00") //Current time zone
        
        return dateFormatter.date(from: stringDate)
    }
    
    func toPrettyString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM yyyy" //Your New Date format as per requirement change it own
        
        return dateFormatter.string(from: self)
    }
}
