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
    @IBOutlet weak var agentLabel: LTMorphingLabel!
    
    func setup(action: Action) {
        //actionImageView.
        agentImageView.sd_setImage(with: action.agent?.picture_url)
        actionImageView.sd_setImage(with: action.iconUrl)
        
        
        
        dateLabel.text = ""
        agentLabel.text = ""
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300), execute: {
            self.dateLabel.text = action.datetime?.toPrettyString()
            
            self.agentLabel.text = action.agent?.name
        })
    }
}
