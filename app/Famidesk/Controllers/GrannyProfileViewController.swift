//
//  GrannyProfileViewController.swift
//  Famidesk
//
//  Created by Mathias Biard on 28/07/2017.
//  Copyright © 2017 CodingOwl. All rights reserved.
//

import Foundation
import UIKit

class GrannyProfileViewController: UIViewController {
    
    var grannyId: String? {
        didSet {
            //testLabel?.text = grannyId
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //testLabel.text = grannyId ?? "Blop"
    }
}
