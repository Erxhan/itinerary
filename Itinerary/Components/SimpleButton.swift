//
//  SimpleButton.swift
//  Itinerary
//
//  Created by Erxhan Selmani on 16/12/2018.
//  Copyright © 2018 Erxhan Selmani. All rights reserved.
//

import UIKit

class SimpleButton: UIButton {
    
    var corners : [CACornerMask] = []
    
    @IBInspectable var topLeftCorner: Bool {
        get {
            return self.layer.maskedCorners.contains(.layerMinXMinYCorner)
        }
        set {
            corners.append(.layerMinXMinYCorner)
            self.layer.maskedCorners = corners
        }
    }
    
    @IBInspectable var topRightCorner: Bool {
        get {
            return self.layer.maskedCorners.contains(.layerMaxXMinYCorner)
        }
        set {
            corners.append(.layerMaxXMinYCorner)
            self.layer.maskedCorners = corners
        }
    }
    
    @IBInspectable var bottomLeftCorner: Bool {
        get {
            return self.layer.maskedCorners.contains(.layerMinXMaxYCorner)
        }
        set {
            corners.append(.layerMinXMaxYCorner)
            self.layer.maskedCorners = corners
        }
    }
    
    @IBInspectable var bottomRightCorner: Bool {
        get {
            return self.layer.maskedCorners.contains(.layerMaxXMaxYCorner)
        }
        set {
            corners.append(.layerMaxXMaxYCorner)
            self.layer.maskedCorners = corners
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
        backgroundColor = Theme.tintColor
        setTitleColor(UIColor.white, for: .normal)
        self.contentHorizontalAlignment = .center
        self.layer.cornerRadius = 10
        //self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

}
