//
//  URLHelper.swift
//  Famidesk
//
//  Created by Mathias Biard on 29/07/2017.
//  Copyright © 2017 CodingOwl. All rights reserved.
//

import Foundation
import UIKit

class URLHelper {
    
    static func getDeviceId() -> String {
        return "78A12647-4910-4162-9FC5-10A5EB259A75" // UIDevice.current.identifierForVendor!.uuidString
    }
    
    static func getUrlForQRCode(qrCodeContent: String) -> URL {
        return URL(string: "http://famidesk.80limit.com/api/patients/\(qrCodeContent).json?device_id=\(getDeviceId())")!
    }
    
    static func getUrlToAddAction() -> URL {
        return URL(string: "http://famidesk.80limit.com/api/actions.json?device_id=\(getDeviceId())")!
    }
}
