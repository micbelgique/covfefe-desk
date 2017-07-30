//
//  ViewController.swift
//  Famidesk
//
//  Created by Mathias Biard on 28/07/2017.
//  Copyright © 2017 CodingOwl. All rights reserved.
//

import UIKit
import Alamofire
import Hero
import NVActivityIndicatorView

class ScanViewController: UIViewController {
    
    var data: [String: Any]?
    
    // Views
    @IBOutlet weak var scannerView: ScannerView!
    @IBOutlet weak var cameraCornerImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    
    var loadingView: NVActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scannerView.qrCodeFoundDelegate = self
        
        profileImageView.heroID = "testHero"
        isHeroEnabled = true
        navigationController?.isHeroEnabled = true
        
        let loadingPoint = CGPoint(x: cameraCornerImageView.center.x - 30, y: cameraCornerImageView.center.y - 30)
        let loadingRect = CGRect(origin: loadingPoint, size: CGSize(width: 60, height: 60))
        
        loadingView = NVActivityIndicatorView(frame: loadingRect, type: .ballPulseSync, color: UIColor.darkGray, padding: 0)
        self.view.addSubview(loadingView!)
        
        /* To remove */
        scannerView.stopScanning()
        showProfile(grannyId: "yo", inRect: CGRect(x: 10, y: 10, width: 100, height: 100))
        /* *** */

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        scannerView.startScanning()
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        profileImageView.image = nil
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Passing the granny id to the next view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let yourVC = segue.destination as? GrannyProfileViewController, let grannyId = sender as? String, let data = data {
            yourVC.patientId = grannyId
            
            // Get patient
            yourVC.patient = data["patient"] as? Patient
            print("Patient: { username: \(yourVC.patient?.name), name: \(yourVC.patient?.age) }")
            
            // Get Actions
            yourVC.actions = data["actions"] as? [Action]
            print("actions: \(yourVC.actions?.count)")
                 
            // Get ActionType
            yourVC.actionsType = data["actionsType"] as? [Action]
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func showProfile(grannyId: String, inRect: CGRect?) {
        scannerView.stopScanning()
        loadData(patientId: grannyId, inRect: inRect)
    }
}

extension ScanViewController: QRCodeFoundDelegate {
    func grannyScanned(grannyId: String, inRect: CGRect?) {
        showProfile(grannyId: grannyId, inRect: inRect)
    }
}

protocol QRCodeFoundDelegate: class {
    func grannyScanned(grannyId: String, inRect: CGRect?)
}

extension ScanViewController {
    // Network
    
    func loadData(patientId: String, inRect: CGRect?) {
        loadingView?.startAnimating()
        if let inRect = inRect?.increaseRect(byPercentage: 0.5) {
            self.profileImageView.frame = inRect
        }
        Alamofire.request(URLHelper.getUrlForQRCode(qrCodeContent: patientId)).responseJSON {
            (response: DataResponse<Any>) in
            
            let patientResponse = response.map { json -> [String: Any]? in
                var result: [String: Any] = [:]
                
                if let patientJson = (json as? [String: Any])?["patient"] {
                    let patient = Patient(json: patientJson)
                    result["patient"] = patient
                    self.profileImageView.sd_setImage(with: patient.picture_url, completed: { (image, error, sdImageCacheType, url) in
                        
                        self.loadingView?.stopAnimating()
                        
                        self.profileImageView.alpha = 0
                        UIView.animate(withDuration: 0.8, animations: {
                            self.profileImageView.alpha = 1
                        })
                        
                        
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1000), execute: {
                            self.performSegue(withIdentifier:"showGrannyProfile", sender: patientId)
                        })
                    })
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
                self.data = data
                
                if data?["patient"] as? Patient == nil {
                    self.patientNotFound()
                }
            }
        }
    }
    
    func patientNotFound() {
        let alert = UIAlertController(title: nil, message: "Erreur, le patient n'a pas été identifié", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        
        //navigationController?.popViewController(animated: true)
        navigationController?.present(alert, animated:true, completion:nil)
    }
}



