//
//  TripCardView.swift
//  Itinerary
//
//  Created by Erxhan Selmani on 14/12/2018.
//  Copyright © 2018 Erxhan Selmani. All rights reserved.
//

import UIKit

class TripCardView: UIView {
    
    let roundedCornerView = UIView()
    
    func setShadow() {
        layer.shadowColor = Theme.tint?.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.masksToBounds = false
        layer.backgroundColor = UIColor.clear.cgColor
    }
    
    func setCorners() {
        roundedCornerView.frame = layer.bounds
        roundedCornerView.layer.cornerRadius = 10
        roundedCornerView.layer.masksToBounds = true
        roundedCornerView.layer.backgroundColor = Theme.background?.cgColor
    }
    

    override func draw(_ rect: CGRect) {
        clipsToBounds = true
        setShadow()
        self.addSubview(roundedCornerView)
        setCorners()
    }
}
