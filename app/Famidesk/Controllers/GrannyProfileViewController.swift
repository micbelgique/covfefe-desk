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
import LTMorphingLabel

class GrannyProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var identityLabel: LTMorphingLabel!
    
    @IBOutlet weak var actionsTableView: UITableView!
    @IBOutlet weak var actionButton: UIButton!
    
    
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
        
        identityLabel.morphingEffect = .burn
        actionButton.layer.cornerRadius = 22
        
        profileImageView.heroID = "testHero"
        isHeroEnabled = true
    }
    
    func updateView() {
        guard let patient = patient else {
            return
        }
        
        profileImageView?.sd_setImage(with: patient.picture_url)
        
        if let name = patient.name, let birthDate = patient.birth_date, let age = patient.age {
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1000), execute: {
                self.identityLabel?.text = "\(name) - \(birthDate.toPrettyString()) (\(age) ans)"
            })
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
        
        
        switch indexPath.row {
        case 0:
            cell.dateLabel.morphingEffect = .fall
        case 1:
            cell.dateLabel.morphingEffect = .pixelate
        case 2:
            cell.dateLabel.morphingEffect = .sparkle
        case 3:
            cell.dateLabel.morphingEffect = .anvil
        case 4:
            cell.dateLabel.morphingEffect = .evaporate
        case 5:
            cell.dateLabel.morphingEffect = .scale
        default:
            cell.dateLabel.morphingEffect = .burn
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actions?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
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
    
    func addAction(action: Action) {
        guard let actionId = action.id, let patientId = patientId else {
            return
        }
        
        
        let parameters: Parameters = [
            "action_type_id": actionId,
            "patient_id": patientId
        ]
        
        Alamofire.request(URLHelper.getUrlToAddAction(), method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON {
            (response: DataResponse<Any>) in
            
            let patientResponse = response.map { json in
                self.actions?.insert(Action(json: json), at: 0)
                self.updateView()
            }
        }
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
                
                self.addAction(action: action)
            }))
        }
        
        alert.addAction(UIAlertAction(title: "Annuler", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(alert, animated:true, completion:nil)
    }
}
