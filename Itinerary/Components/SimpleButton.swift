//
//  SimpleButton.swift
//  Itinerary
//
//  Created by Erxhan Selmani on 16/12/2018.
//  Copyright © 2018 Erxhan Selmani. All rights reserved.
//

import UIKit

@IBDesignable class SimpleButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 1 {
        didSet {
            refreshCorners(value: cornerRadius)
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
        refreshCorners(value: cornerRadius)
    }
    
    func refreshCorners(value: CGFloat) {
        self.layer.cornerRadius = value
    }
    
}
