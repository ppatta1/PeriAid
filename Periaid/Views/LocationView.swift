//
//  LocationView.swift
//  Periaid
//
//  Created by Padma Priya on 6/10/21.
//

import SwiftUI
import MapKit

struct LocationView: View {
    
    @ObservedObject var locationManager = LocationManager()
    @State private var searchLocation = ""
    @State private var searchViewShown = false
    @State private var filterPageShown = false
//    private var userLocation: CLLocation? {
//        didSet {
//            self.didClicksearchEntered()
//        }
//    }
    @State private var locations: [LocationModel] = [LocationModel]()
    
    private func didClicksearchEntered(_ searchString: String? = nil) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchString ?? searchLocation
        
        let searchLocation = MKLocalSearch(request: request)
        searchLocation.start { (response, error) in
            guard let response = response else {
                return
            }
            
            let mapItems = response.mapItems
            self.locations = mapItems.map {
                LocationModel(placemark: $0.placemark)
            }
        }
    }
    
//    init() {
//        userLocation = locationManager.location
//    }
    
    var body: some View {
        ZStack {
            ScrollViewReader { proxy in
                ZStack(alignment: .bottom) {
                    ZStack(alignment: .top) {
                        MapView(locations: locations)
                            
                        VStack {
                            HStack {
                                Image (systemName: "magnifyingglass")
                                    .padding()
                                TextField("What are you looking for?", text: $searchLocation, onEditingChanged: { _ in }) {
                                    self.didClicksearchEntered()
                                }.onTapGesture {
                                    didClicksearchEntered("Shelters near you")
                                    searchViewShown.toggle()
                                }
                                    .padding()
                                Image(systemName: "line.horizontal.3")
                                    .padding()
                                    .onTapGesture {
                                        filterPageShown.toggle()
                                    }
                            }
                            .background(Color(red: 245/255, green: 217/255, blue: 217/255))
                            .cornerRadius(10)
                        }
                        .padding()
                    }
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(locations, id: \.self) { i in
                                LocationCardView(name: i.name)
                                    .id(i)
                            }
                        }.padding()
                    }
                }
            }
            if searchViewShown {
                VStack(alignment: .leading) {
                    HStack {
                        Image (systemName: "chevron.left")
                            .foregroundColor(.accentColor)
                            .padding()
                            .onTapGesture {
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                                searchViewShown.toggle()
                            }
                        TextField("What are you looking for?", text: $searchLocation, onEditingChanged: { _ in }) {
                            searchViewShown.toggle()
                            self.didClicksearchEntered()
                        }
                        .padding()
                        Image(systemName: "line.horizontal.3")
                            .padding()
                            .onTapGesture {
                                filterPageShown.toggle()
                            }
                    }.background(Color(red: 245/255, green: 217/255, blue: 217/255))
                    .cornerRadius(10)
                    .padding()
                    Text("Favorites")
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                        .padding(.horizontal, 40)
                        .padding(.vertical, 10)
                    Spacer()
                    Text("Shelters near you")
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                        .padding(.horizontal, 40)
                        .padding(.vertical, 10)
                    List {
                        ForEach(locations.prefix(5), id: \.self) {
                            LocationListView(name: $0.name)
                        }
                    }
                }
                .background(Color.white)
            }
        }.onReceive(locationManager.$location) { (_) in
            self.didClicksearchEntered("Shelters near you")
        }.fullScreenCover(isPresented: $filterPageShown, content: {
            FilterPageView()
        })
    }
    
    private enum textField: Int, Hashable {
        case searchField
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
