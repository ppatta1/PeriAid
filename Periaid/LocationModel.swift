//
//  LocationModel.swift
//  Periaid
//
//  Created by Padma Priya on 7/8/21.
//

import Foundation
import MapKit

struct LocationModel: Hashable {
    let placemark: MKPlacemark
    
    var id: UUID {
        return UUID()
    }
    
    var name: String {
        return self.placemark.name ?? ""
    }
    
    var title: String {
        return self.placemark.title ?? ""
    }
    
    var coordinate: CLLocationCoordinate2D {
        return self.placemark.coordinate
    }
}
