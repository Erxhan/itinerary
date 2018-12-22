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
    var tripIndexToEdit: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = 10
        imageView.layer.opacity = 0.4
        
        if let index = tripIndexToEdit {
            let trip = Data.tripModels[index]
            textField.text = trip.title
            imageView.image = trip.image
        }
        
    }
    
    @IBAction func save(_ sender: SimpleButton) {
        
        textField.rightViewMode = .never
        
        // Setup textField validation
        guard textField.text != "", let newTripName = textField.text else {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: textField.frame.size.height - 10))
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
        
        if let index = tripIndexToEdit {
            TripFunctions.updateTrip(at: index, title: newTripName, image: imageView.image)
        } else {
            TripFunctions.createTrip(tripModel: TripModel(title: newTripName, image: imageView.image))
        }
        
        guard let doneSaving = doneSaving else { return }
        doneSaving()
        dismiss(animated: true)
    }
    
    @IBAction func cancel(_ sender: SimpleButton) {
        dismiss(animated: true)
    }
    
    fileprivate func presentPhotoPickerController() {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = .photoLibrary
        self.present(myPickerController, animated: true)
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
        PHPhotoLibrary.requestAuthorization { (status) in
            switch status {
            case .authorized:
                self.presentPhotoPickerController()
            case .notDetermined:
                if status == PHAuthorizationStatus.authorized {
                    self.presentPhotoPickerController()
                }
            case .restricted:
                let alert = UIAlertController(title: "Photo Library Restricted", message: "Photo Library access is restricted in your settings", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
            case .denied:
                let alert = UIAlertController(title: "Photo Library Denied", message: "Photo Library access is denied", preferredStyle: .alert)
                let settingsAction = UIAlertAction(title: "Go to Settings", style: .default) { (action) in
                    DispatchQueue.main.async {
                        let url = URL(string: UIApplication.openSettingsURLString)!
                        UIApplication.shared.open(url, options: [:])
                    }
                }
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                alert.addAction(settingsAction)
                alert.addAction(cancelAction)
                self.present(alert, animated: true)
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
