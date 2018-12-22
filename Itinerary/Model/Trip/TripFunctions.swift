//
//  TripFunctions.swift
//  Itinerary
//
//  Created by Exrhan Selmani on 13/12/2018.
//  Copyright © 2018 Erxhan Selmani. All rights reserved.
//

import UIKit

class TripFunctions {
    static func createTrip(tripModel: TripModel) {
        Data.tripModels.append(tripModel)
    }
    
    static func readTrips(completion: @escaping () -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.tripModels.count == 0 {
                Data.tripModels.append(TripModel(title: "Trip to Belgium!"))
                Data.tripModels.append(TripModel(title: "Trip to Japan!"))
                Data.tripModels.append(TripModel(title: "Trip to Usa!"))
                Data.tripModels.append(TripModel(title: "Trip to Makedonia!"))
                Data.tripModels.append(TripModel(title: "Trip to Turkey!"))
                Data.tripModels.append(TripModel(title: "Trip to Dubai!"))
                Data.tripModels.append(TripModel(title: "Trip to Brasil!"))
            }
        }
        
        DispatchQueue.main.async {
            completion()
        }
    }
    
    static func updateTrip(at index: Int, title: String, image: UIImage? = nil) {
        Data.tripModels[index].title = title
        Data.tripModels[index].image = image
    }
    
    static func deleteTrip(index: Int) {
        Data.tripModels.remove(at: index)
    }
}
