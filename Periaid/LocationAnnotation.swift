//
//  LocationAnnotation.swift
//  Periaid
//
//  Created by Padma Priya on 7/8/21.
//

import Foundation
import MapKit

final class LocationAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(model: LocationModel) {
        self.title = model.name
        self.coordinate = model.coordinate
    }
}
