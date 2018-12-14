//
//  TripsTableViewCell.swift
//  Itinerary
//
//  Created by Exrhan Selmani on 14/12/2018.
//  Copyright © 2018 Erxhan Selmani. All rights reserved.
//

import UIKit

class TripsTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: TripCardView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 32)
    }
    
    func setup(tripModel: TripModel) {
        titleLabel.text = tripModel.title
        titleLabel.textColor = Theme.accent
    }
}
