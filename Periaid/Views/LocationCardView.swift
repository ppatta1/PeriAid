//
//  LocationCardView.swift
//  Periaid
//
//  Created by Padma Priya on 6/23/21.
//

import SwiftUI

struct LocationCardView: View {
    @State var name: String
    
    var body: some View {
        ZStack {
            Color.white.cornerRadius(10)
            VStack(alignment: .leading) {
                Image("ChurchImage")
                    .resizable()
                    .cornerRadius(8)
                Spacer()
                Text(name)
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                Spacer()
                HStack {
                    Text("2 miles away")
                        .foregroundColor(.accentColor)
                        .font(.system(size: 14))
                    Spacer()
                    Text("15 reviews")
                        .foregroundColor(Color(red: 76/255, green: 80/255, blue: 83/255))
                        .font(.system(size: 14))
                }
            }.padding()
        }
        .frame(width: 250, height: 180)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 0)
    }
}

struct LocationCardView_Previews: PreviewProvider {
    static var previews: some View {
        LocationCardView(name: "")
    }
}
