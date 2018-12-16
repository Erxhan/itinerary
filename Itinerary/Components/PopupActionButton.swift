//
//  PopupActionButton.swift
//  Itinerary
//
//  Created by Erxhan Selmani on 16/12/2018.
//  Copyright © 2018 Erxhan Selmani. All rights reserved.
//

import UIKit

class PopupActionButton: UIButton {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.backgroundColor = Theme.tintColor
        self.layer.cornerRadius = frame.height / 2
        self.setTitleColor(Theme.backgroundColor, for: .normal)
    }

}
