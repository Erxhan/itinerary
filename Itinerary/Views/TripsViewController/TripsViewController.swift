//
//  TripsViewController.swift
//  Itinerary
//
//  Created by Erxhan Selmani on 13/12/2018.
//  Copyright © 2018 Erxhan Selmani. All rights reserved.
//

import UIKit

class TripsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: AddButton!
    @IBOutlet var helpView: UIVisualEffectView!
    
    var tripIndexToEdit: Int?
    var seenTripHelp = "seenTripHelp"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = UIColor.clear
        
        // Weak is to avoid the strong reference to the class (hog memory)
        TripFunctions.readTrips { [unowned self] in
            self.tableView.reloadData()
            
            if Data.tripModels.count > 0 {
                if UserDefaults.standard.bool(forKey: self.seenTripHelp) == false {
                    self.view.addSubview(self.helpView)
                    self.helpView.frame = self.view.frame
                }
            }
        }
        
    }
    
    @IBAction func closeHelpView(_ sender: AddButton) {
        UIView.animate(withDuration: 0.3, animations: {
            self.helpView.alpha = 0
        }) { (success) in
            self.helpView.removeFromSuperview()
            UserDefaults.standard.set(true, forKey: self.seenTripHelp)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddTripSegue" {
            let popup = segue.destination as! AddTripsViewController
            popup.tripIndexToEdit = self.tripIndexToEdit
            popup.doneSaving = { [weak self] in
                self?.tableView.reloadData()
            }
            tripIndexToEdit = nil
        }
    }
}


extension TripsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TripsTableViewCell
        cell.setup(tripModel: Data.tripModels[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // let trip = Data.tripModels[indexPath.row]
        
        let delete = UIContextualAction(style: .destructive, title: "") { (contextualAction, view, actionPerformed: @escaping (Bool) -> Void) in
            
            //            let alert = UIAlertController(title: "Delete Trip", message: "Are you sure to delete \(trip.title) ?", preferredStyle: .alert)
            //            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) in
            //                actionPerformed(false)
            //            }))
            //            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (alertAction) in
            //                TripFunctions.deleteTrip(index: indexPath.row)
            //                tableView.deleteRows(at: [indexPath], with: .left)
            //                actionPerformed(true)
            //            }))
            //            self.present(alert, animated: true)
            
            TripFunctions.deleteTrip(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            actionPerformed(true)
            
        }
        delete.image = UIImage(named: "delete")?.ResizeImage(targetSize: CGSize(width: 30, height: 30))
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let edit = UIContextualAction(style: .normal, title: "") { (contextualAction, view, actionPerformed: (Bool) -> Void) in
            self.tripIndexToEdit = indexPath.row
            self.performSegue(withIdentifier: "toAddTripSegue", sender: nil)
            actionPerformed(true)
        }
        edit.backgroundColor = Theme.editColor
        edit.image = UIImage(named: "edit")?.ResizeImage(targetSize: CGSize(width: 30, height: 30))
        return UISwipeActionsConfiguration(actions: [edit])
    }
    
}
