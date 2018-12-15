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
    
    func setShadow(shadowColor: UIColor, shadowOpacity: Float, shadowRadius: CGFloat) {
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.masksToBounds = false
    }
}
