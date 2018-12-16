//
//  UIViewExtensions.swift
//  Itinerary
//
//  Created by Exrhan Selmani on 14/12/2018.
//  Copyright © 2018 Erxhan Selmani. All rights reserved.
//

import UIKit

extension UIView {
    
    func setRoundedCorners(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    func setShadow() {
        layer.shadowColor = Theme.accentColor?.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.masksToBounds = false
    }
}
