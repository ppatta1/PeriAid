//
//  LocationSearchListView.swift
//  Periaid
//
//  Created by Padma Priya on 7/21/21.
//

import SwiftUI
import MapKit

struct LocationSearchListView: View {
    
    let locations: [LocationModel]
    @State private var searchLocation = ""
    @Environment(\.presentationMode) var presentationMode 
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image (systemName: "magnifyingglass")
                    .padding()
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                TextField("What are you looking for?", text: $searchLocation, onEditingChanged: { _ in }) {
//                        self.didClicksearchEntered()
                }
//                    .onTapGesture {
//                        didClicksearchEntered()
//                        searchViewShown.toggle()
//                    }
                    .padding()
//                    .sheet(isPresented: $searchViewShown) {
//                        LocationSearchListView(locations: locations)
//                    }
                Image(systemName: "line.horizontal.3")
                    .padding()
            }
            .background(Color(red: 245, green: 217, blue: 217))
            .cornerRadius(10)
            Text("Search results near you")
                .fontWeight(.bold)
                .font(.system(size: 20))
                .padding()
            List {
                ForEach(locations, id: \.self) {
                    LocationListView(name: $0.name)
                }
            }
        }.padding()
    }
}

struct LocationSearchListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchListView(locations: [LocationModel(placemark: MKPlacemark())])
    }
}
