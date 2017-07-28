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
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var identityLabel: UILabel!
    
    @IBOutlet weak var actionsTableView: UITableView!
    
    var grannyId: String? {
        didSet {
            if grannyId != nil {
                initTableView()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if grannyId != nil {
            initTableView()
        }
    }
    
    func initTableView() {
        actionsTableView?.delegate = self
        actionsTableView?.dataSource = self
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func actionButtonClicked(_ sender: Any) {
        NSLog("Action button clicked")
    }
}

extension GrannyProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        cell = tableView.dequeueReusableCell(withIdentifier: "actionCell") as! ActionCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
}

extension GrannyProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO
    }
}
