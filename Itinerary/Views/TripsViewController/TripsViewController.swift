//
//  TripsViewController.swift
//  Itinerary
//
//  Created by Erxhan Selmani on 13/12/2018.
//  Copyright © 2018 Erxhan Selmani. All rights reserved.
//

import UIKit

class TripsViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        // Weak is to avoid the strong reference to the class (hog memory)
        TripFunctions.readTrips { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
         cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell!.textLabel?.text = Data.tripModels[indexPath.row].title
        return cell!
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
