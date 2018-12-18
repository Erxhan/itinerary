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

}
