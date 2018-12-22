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
    @IBOutlet weak var tripImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tripImageView.layer.cornerRadius = 10
    }
    
    func setup(tripModel: TripModel) {
        titleLabel.text = tripModel.title
        
        if let tripImage = tripModel.image {
            tripImageView.alpha = 0.3
            tripImageView.image = tripImage
            UIView.animate(withDuration: 0.6) {
                self.tripImageView.alpha = 1
            }
        }
    }
}
