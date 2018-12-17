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
    
    var doneSaving: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func save(_ sender: SimpleButton) {
        TripFunctions.createTrip(tripModel: TripModel(title: textField.text!))
        guard let doneSaving = doneSaving else { return }
        doneSaving()
        dismiss(animated: true)
    }
    
    @IBAction func cancel(_ sender: SimpleButton) {
        dismiss(animated: true)
    }
}
