//
//  MapView.swift
//  Periaid
//
//  Created by Padma Priya on 6/10/21.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    let locations: [LocationModel]
    var selectedAnnotation: MKPointAnnotation?
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        updateAnnotations(from: uiView)
    }
    
    private func updateAnnotations(from mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        let annotations = self.locations.map(LocationAnnotation.init)
        mapView.addAnnotations(annotations)
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) { 
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
            if let annotationView = views.first {
                if let annotation = annotationView.annotation {
                    if annotation is MKUserLocation {
                        let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                        mapView.setRegion(region, animated: true)
                    }
                }
            }
        }
        
//        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
//            self.parent.centerCoordinate = mapView.centerCoordinate
//        }
    }
}

//extension MKUserLocation {
//    static var userLocation: MKPointAnnotation {
//        let annotation = MKPointAnnotation()
//        annotation.title = "Annotation Title"
//        annotation.subtitle = "Annotation Sub Title"
//        annotation.coordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
//        return annotation
//    }
//}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(locations: [])
    }
}
