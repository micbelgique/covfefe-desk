//
//  ViewController.swift
//  Famidesk
//
//  Created by Mathias Biard on 28/07/2017.
//  Copyright © 2017 CodingOwl. All rights reserved.
//

import UIKit

class ScanViewController: UIViewController {
    
    // Views
    @IBOutlet weak var scannerView: ScannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scannerView.qrCodeFoundDelegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Passing the granny id to the next view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let yourVC = segue.destination as? GrannyProfileViewController, let grannyId = sender as? String {
            yourVC.grannyId = grannyId
        }
    }
}

extension ScanViewController: QRCodeFoundDelegate {
    func grannyScanned(grannyId: String) {
        scannerView.stopScanning()
        performSegue(withIdentifier:"showGrannyProfile", sender: grannyId)
    }
}

protocol QRCodeFoundDelegate: class {
    func grannyScanned(grannyId: String)
}



