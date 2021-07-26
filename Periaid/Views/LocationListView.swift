//
//  LocationListView.swift
//  Periaid
//
//  Created by Padma Priya on 7/22/21.
//

import SwiftUI

struct LocationListView: View {
    @State var name: String
    
    var body: some View {
        ZStack {
            HStack(alignment: .bottom) {
                Image("ChurchImage")
                    .resizable()
                    .frame(width: 64, height: 48)
                    .cornerRadius(8)
                VStack(alignment: .leading) {
                    Text(name)
                        .fontWeight(.medium)
                        .font(.system(size: 15))
                    Spacer()
                    Text("2 miles away")
                        .fontWeight(.ultraLight)
                        .font(.system(size: 12))
                }.frame(height: 38)
            }.padding()
        }
        .frame(height: 60)
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView(name: "")
    }
}
