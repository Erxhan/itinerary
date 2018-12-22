//
//  TripImageView.swift
//  Itinerary
//
//  Created by Erxhan Selmani on 22/12/2018.
//  Copyright © 2018 Erxhan Selmani. All rights reserved.
//

import UIKit

class TripImageView: UIImageView {

    @IBInspectable var cornerRadius: CGFloat = 1 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var topLeftCorner: Bool = true {
        didSet {
            if topLeftCorner {
                layer.maskedCorners.insert(.layerMinXMinYCorner)
            } else {
                layer.maskedCorners.remove(.layerMinXMinYCorner)
            }
        }
    }
    
    @IBInspectable var topRightCorner: Bool = true {
        didSet {
            if topRightCorner {
                layer.maskedCorners.insert(.layerMaxXMinYCorner)
            } else {
                layer.maskedCorners.remove(.layerMaxXMinYCorner)
            }
        }
    }
    
    @IBInspectable var bottomLeftCorner: Bool = true {
        didSet {
            if bottomLeftCorner {
                layer.maskedCorners.insert(.layerMinXMaxYCorner)
            } else {
                layer.maskedCorners.remove(.layerMinXMaxYCorner)
            }
        }
    }
    
    @IBInspectable var bottomRightCorner: Bool = true {
        didSet {
            if bottomRightCorner {
                layer.maskedCorners.insert(.layerMaxXMaxYCorner)
            } else {
                layer.maskedCorners.remove(.layerMaxXMaxYCorner)
            }
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        setup()
    }
    
    func setup() {
        layer.cornerRadius = cornerRadius
    }

}
