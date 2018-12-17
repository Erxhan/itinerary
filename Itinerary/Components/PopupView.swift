//
//  PopupView.swift
//  Itinerary
//
//  Created by Erxhan Selmani on 16/12/2018.
//  Copyright © 2018 Erxhan Selmani. All rights reserved.
//

import UIKit

class PopupView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        layer.cornerRadius = 10
        layer.masksToBounds = true
        backgroundColor = UIColor.white
    }

}
