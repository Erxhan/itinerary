//
//  FloatingActionButton.swift
//  Itinerary
//
//  Created by Erxhan Selmani on 14/12/2018.
//  Copyright © 2018 Erxhan Selmani. All rights reserved.
//

import UIKit

class FloatingActionButton: UIButton {

    override func draw(_ rect: CGRect) {
        layer.backgroundColor = Theme.tintColor?.cgColor
        layer.cornerRadius = frame.height / 2
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: 0, height: 3)
    }

}
