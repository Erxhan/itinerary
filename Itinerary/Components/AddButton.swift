//
//  AddButton.swift
//  Itinerary
//
//  Created by Exrhan Selmani on 17/12/2018.
//  Copyright © 2018 Erxhan Selmani. All rights reserved.
//

import UIKit

class AddButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        backgroundColor = Theme.tintColor
        layer.cornerRadius = frame.height / 2
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: 0, height: 3)
        setTitleColor(UIColor.white, for: .normal)
    }
}
