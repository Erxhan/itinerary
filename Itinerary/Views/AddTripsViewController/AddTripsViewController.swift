//
//  AddTripsViewController.swift
//  Itinerary
//
//  Created by Erxhan Selmani on 16/12/2018.
//  Copyright © 2018 Erxhan Selmani. All rights reserved.
//

import UIKit
import Photos

class AddTripsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: PopupTitleLabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var doneSaving: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = 10
        imageView.layer.opacity = 0.2

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
    
    @IBAction func addPhoto(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status {
                case .authorized:
                    let myPickerController = UIImagePickerController()
                    myPickerController.delegate = self
                    myPickerController.sourceType = .photoLibrary
                    self.present(myPickerController, animated: true)
                default:
                    break
//                case .notDetermined:
//                    <#code#>
//                case .restricted:
//                    <#code#>
//                case .denied:
//                    <#code#>
//                case .authorized:
//                    <#code#>
                }
            }
        }
    }
}

extension AddTripsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.image = image
        }
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}
