//
//  TripModel.swift
//  Itinerary
//
//  Created by Exrhan Selmani on 13/12/2018.
//  Copyright © 2018 Erxhan Selmani. All rights reserved.
//

import Foundation

class TripModel {
    var id: UUID
    var title: String
    
    init(title: String) {
        id = UUID()
        self.title = title
    }
}