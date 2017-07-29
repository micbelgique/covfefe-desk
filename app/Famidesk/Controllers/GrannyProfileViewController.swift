//
//  GrannyProfileViewController.swift
//  Famidesk
//
//  Created by Mathias Biard on 28/07/2017.
//  Copyright © 2017 CodingOwl. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SDWebImage

class GrannyProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var identityLabel: UILabel!
    
    @IBOutlet weak var actionsTableView: UITableView!
    
    var patient: Patient? {
        didSet {
            updateView()
        }
    }
    
    var patientId: String? {
        didSet {
            if let patientId = patientId, patient == nil {
                loadData(patientId: patientId)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if patient != nil {
            initTableView()
        }
    }
    
    func updateView() {
        guard let patient = patient else {
            return
        }
        
        profileImageView.sd_setImage(with: patient.picture_url)
        
        if let name = patient.name, let birthDate = patient.birth_date, let age = patient.age {
            identityLabel.text = "\(name) - \(birthDate.toPrettyString()) (\(age) ans)"
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

extension GrannyProfileViewController {
    // Network
    
    func loadData(patientId: String) {
        Alamofire.request(URLHelper.getUrlForQRCode(qrCodeContent: patientId)).responseJSON {
            (response: DataResponse<Any>) in
            
            let patientResponse = response.map { json -> Patient? in
                // We assume an existing User(json: Any) initializer
                if let patientJson = (json as? [String: Any])?["patient"] {
                    return Patient(json: patientJson)
                }
                return nil
            }
            
            //Process patientResponse, of type DataResponse<Patient>:
            if let patient = patientResponse.value {
                print("Patient: { username: \(patient?.name), name: \(patient?.age) }")
                self.patient = patient
                self.updateView()
            }
        }
    }
}
