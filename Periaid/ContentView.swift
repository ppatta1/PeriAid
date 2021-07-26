//
//  ContentView.swift
//  Periaid
//
//  Created by Padma Priya on 6/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomePageView()
            .accentColor(Color(red: 239/255, green: 102/255, blue: 103/255))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
