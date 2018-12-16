//
//  TripsTableViewCell.swift
//  Itinerary
//
//  Created by Exrhan Selmani on 14/12/2018.
//  Copyright © 2018 Erxhan Selmani. All rights reserved.
//

import UIKit

class TripsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: TitleLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(tripModel: TripModel) {
        titleLabel.text = tripModel.title
    }
}
