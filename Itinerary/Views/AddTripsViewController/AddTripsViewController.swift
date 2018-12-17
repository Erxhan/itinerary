//
//  AddTripsViewController.swift
//  Itinerary
//
//  Created by Erxhan Selmani on 16/12/2018.
//  Copyright © 2018 Erxhan Selmani. All rights reserved.
//

import UIKit

class AddTripsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: PopupTitleLabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func save(_ sender: SimpleButton) {
        dismiss(animated: true)
    }
    
    @IBAction func cancel(_ sender: SimpleButton) {
        dismiss(animated: true)
    }
}
