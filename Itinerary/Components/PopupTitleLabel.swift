//
//  PopupTitleLabel.swift
//  Itinerary
//
//  Created by Erxhan Selmani on 16/12/2018.
//  Copyright © 2018 Erxhan Selmani. All rights reserved.
//

import UIKit

class PopupTitleLabel: UILabel {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.font = UIFont(name: Theme.mainFontName, size: 22)
        self.textColor = Theme.tintColor
    }

}
