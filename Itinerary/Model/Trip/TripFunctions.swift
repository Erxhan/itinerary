//
//  TripFunctions.swift
//  Itinerary
//
//  Created by Exrhan Selmani on 13/12/2018.
//  Copyright © 2018 Erxhan Selmani. All rights reserved.
//

import Foundation

class TripFunctions {
    static func createTrip(tripModel: TripModel) {
        
    }
    
    static func readTrips(completion: @escaping () -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.tripModels.count == 0 {
                Data.tripModels.append(TripModel(title: "Trip to New York!"))
                Data.tripModels.append(TripModel(title: "Trip to Japan!"))
                Data.tripModels.append(TripModel(title: "Trip to Istanbul!"))
                Data.tripModels.append(TripModel(title: "Trip to Dubai!"))
                Data.tripModels.append(TripModel(title: "Trip to Rio De Janeiro!"))
                Data.tripModels.append(TripModel(title: "Trip to Quebec!"))
                Data.tripModels.append(TripModel(title: "Trip to Bruxelles!"))
                Data.tripModels.append(TripModel(title: "Trip to Skopje!"))
            }
        }
        
        DispatchQueue.main.async {
            completion()
        }
    }
    
    static func updateTrip(tripModel: TripModel) {
        
    }
    
    static func deleteTrip(tripModel: TripModel) {
        
    }
}
