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
    
    var tripIndexToEdit: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = UIColor.clear
        
        // Weak is to avoid the strong reference to the class (hog memory)
        TripFunctions.readTrips { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddTripSegue" {
            let popup = segue.destination as! AddTripsViewController
            popup.tripIndexToEdit = self.tripIndexToEdit
            popup.doneSaving = { [weak self] in
                self?.tableView.reloadData()
            }
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
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, actionPerformed: @escaping (Bool) -> Void) in
            
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
        //delete.image = #imageLiteral(resourceName: "delete")
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let edit = UIContextualAction(style: .normal, title: "Edit") { (contextualAction, view, actionPerformed: (Bool) -> Void) in
            self.tripIndexToEdit = indexPath.row
            self.performSegue(withIdentifier: "toAddTripSegue", sender: nil)
            actionPerformed(true)
        }
        edit.backgroundColor = Theme.editColor
        return UISwipeActionsConfiguration(actions: [edit])
    }

}
