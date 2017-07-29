//
//  ActionCell.swift
//  Famidesk
//
//  Created by Mathias Biard on 28/07/2017.
//  Copyright © 2017 CodingOwl. All rights reserved.
//

import Foundation
import UIKit

class ActionCell: UITableViewCell {
    
    @IBOutlet weak var actionImageView: UIImageView!
    @IBOutlet weak var agentImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    func setup(action: Action) {
        //actionImageView.
        agentImageView.sd_setImage(with: action.agent?.picture_url)
        dateLabel.text = action.datetime?.toPrettyString()
    }
}
