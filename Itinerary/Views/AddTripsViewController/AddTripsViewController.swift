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
        
        textField.rightViewMode = .never
        
        guard textField.text != "", let newTripName = textField.text else {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: textField.frame.size.height - 10))
            //imageView.image = UIImage(named: "warning")
            imageView.image = #imageLiteral(resourceName: "warning")
            imageView.contentMode = .scaleAspectFit
            textField.rightView = imageView
            textField.rightViewMode = .always
            textField.layer.borderColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
            textField.layer.borderWidth = 1
            textField.layer.cornerRadius = 5
            textField.placeholder = "Trip name is required"
            return
        }
        
        TripFunctions.createTrip(tripModel: TripModel(title: newTripName))
        guard let doneSaving = doneSaving else { return }
        doneSaving()
        dismiss(animated: true)
    }
    
    @IBAction func cancel(_ sender: SimpleButton) {
        dismiss(animated: true)
    }
}
