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
    static func getUrlForQRCode(qrCodeContent: String) -> URL {
        return URL(string: "http://famidesk.80limit.com/api/patients/\(qrCodeContent).json?device_id=\(UIDevice.current.identifierForVendor!.uuidString)")!
    }
    
    static func getUrlToAddAction() -> URL {
        return URL(string: "http://famidesk.80limit.com/api/actions?device_id=\(UIDevice.current.identifierForVendor!.uuidString)")!
    }
}
