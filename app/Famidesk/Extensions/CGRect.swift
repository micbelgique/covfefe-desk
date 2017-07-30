//
//  CGRect.swift
//  Famidesk
//
//  Created by Mathias Biard on 30/07/2017.
//  Copyright © 2017 CodingOwl. All rights reserved.
//

import Foundation
import UIKit

extension CGRect {
    func increaseRect(byPercentage percentage: CGFloat) -> CGRect {
        let startWidth = self.width
        let startHeight = self.height
        let adjustmentWidth = (startWidth * percentage) / 2.0
        let adjustmentHeight = (startHeight * percentage) / 2.0
        return self.insetBy(dx: -adjustmentWidth, dy: -adjustmentHeight)
    }
}
