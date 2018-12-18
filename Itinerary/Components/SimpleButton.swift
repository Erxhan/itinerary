//
//  SimpleButton.swift
//  Itinerary
//
//  Created by Erxhan Selmani on 16/12/2018.
//  Copyright © 2018 Erxhan Selmani. All rights reserved.
//

import UIKit

class SimpleButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        backgroundColor = Theme.tintColor
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: 0, height: 3)
        setTitleColor(UIColor.white, for: .normal)
        self.heightAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
        self.widthAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
    }

}
