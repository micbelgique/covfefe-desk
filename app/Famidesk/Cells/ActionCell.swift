//
//  ActionCell.swift
//  Famidesk
//
//  Created by Mathias Biard on 28/07/2017.
//  Copyright © 2017 CodingOwl. All rights reserved.
//

import Foundation
import UIKit
import LTMorphingLabel

class ActionCell: UITableViewCell {
    
    @IBOutlet weak var actionImageView: UIImageView!
    @IBOutlet weak var agentImageView: UIImageView!
    @IBOutlet weak var dateLabel: LTMorphingLabel!
    
    func setup(action: Action) {
        //actionImageView.
        agentImageView.sd_setImage(with: action.agent?.picture_url)
        actionImageView.sd_setImage(with: action.iconUrl)
        
        
        dateLabel.text = ""
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1000), execute: {
            self.dateLabel.text = action.datetime?.toPrettyString()
        })
    }
}
