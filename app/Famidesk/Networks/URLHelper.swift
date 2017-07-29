//
//  URLHelper.swift
//  Famidesk
//
//  Created by Mathias Biard on 29/07/2017.
//  Copyright © 2017 CodingOwl. All rights reserved.
//

import Foundation

class URLHelper {
    static func getUrlForQRCode(qrCodeContent: String) -> URL {
        return URL(string: "http://famidesk.80limit.com/api/patients/\(qrCodeContent).json?device_id=78A12647-4910-4162-9FC5-10A5EB259A75")!
    }
}
