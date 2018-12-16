//
//  TripCardView.swift
//  Itinerary
//
//  Created by Erxhan Selmani on 14/12/2018.
//  Copyright © 2018 Erxhan Selmani. All rights reserved.
//

import UIKit

class TripCardView: UIView {

    override func draw(_ rect: CGRect) {
        layer.cornerRadius = 10
        layer.masksToBounds = true
        layer.backgroundColor = Theme.tintColor?.cgColor
    }
    
}
