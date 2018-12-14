//
//  UIViewExtensions.swift
//  Itinerary
//
//  Created by Exrhan Selmani on 14/12/2018.
//  Copyright © 2018 Erxhan Selmani. All rights reserved.
//

import UIKit

extension UIView {
    func addShadowAndRoundedCorners() {
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 2
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10
    }
}
