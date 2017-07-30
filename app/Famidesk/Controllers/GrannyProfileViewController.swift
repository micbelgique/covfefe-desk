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
import Hero

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
    
    var actions: [Action]?
    var actionsType: [Action]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if patient != nil {
            initTableView()
            updateView()
        }
        
        profileImageView.heroID = "testHero"
        isHeroEnabled = true
    }
    
    func updateView() {
        guard let patient = patient else {
            return
        }
        
        profileImageView?.sd_setImage(with: patient.picture_url)
        
        if let name = patient.name, let birthDate = patient.birth_date, let age = patient.age {
            identityLabel?.text = "\(name) - \(birthDate.toPrettyString()) (\(age) ans)"
        }
        
        initTableView()
        actionsTableView?.reloadData()
    }
    
    func initTableView() {
        actionsTableView?.delegate = self
        actionsTableView?.dataSource = self
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func actionButtonClicked(_ sender: Any) {
        showActionSheet()
    }
}

extension GrannyProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: ActionCell
        cell = tableView.dequeueReusableCell(withIdentifier: "actionCell") as! ActionCell
        cell.setup(action: actions![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actions?.count ?? 0
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
            
            let patientResponse = response.map { json -> [String: Any]? in
                var result: [String: Any] = [:]
                
                if let patientJson = (json as? [String: Any])?["patient"] {
                    result["patient"] = Patient(json: patientJson)
                }
                
                if let actionsJson = (json as? [String: Any])?["actions"] as? [[String: Any]] {
                    var actions: [Action] = []
                    for actionJson in actionsJson {
                        actions.append(Action(json: actionJson))
                    }
                    
                    result["actions"] = actions
                }
                
                if let actionsTypeJson = (json as? [String: Any])?["action_types"] as? [[String: Any]] {
                    var actionsType: [Action] = []
                    for actionTypeJson in actionsTypeJson {
                        actionsType.append(Action(json: actionTypeJson))
                    }
                    
                    result["actionsType"] = actionsType
                }
                
                return result
            }
            
            //Process patientResponse, of type DataResponse<Patient>:
            if let data = patientResponse.value {
                
                // Get patient
                self.patient = data?["patient"] as? Patient
                print("Patient: { username: \(self.patient?.name), name: \(self.patient?.age) }")
                if self.patient == nil {
                    self.patientNotFound()
                }
                
                // Get Actions
                self.actions = data?["actions"] as? [Action]
                print("actions: \(self.actions?.count)")
                
                // Get ActionType
                self.actionsType = data?["actionsType"] as? [Action]
                
                self.updateView()
            }
        }
    }
    
    func patientNotFound() {
        var alert = UIAlertController(title: nil, message: "Erreur, le patient n'a pas été identifié", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        
        navigationController?.popViewController(animated: true)
        navigationController?.present(alert, animated:true, completion:nil)
    }
}

// Action Sheet

extension GrannyProfileViewController {
    
    func showActionSheet() {
        var alert = UIAlertController(title: nil, message: "Quel action allez vous effectuer ?", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        
        for action in actionsType ?? [] as [Action] {
            alert.addAction(UIAlertAction(title: action.name, style: UIAlertActionStyle.default, handler: {
                alert in
                NSLog("Action -> \(action.name)")
            }))
        }
        
        alert.addAction(UIAlertAction(title: "Annuler", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(alert, animated:true, completion:nil)
    }
}
