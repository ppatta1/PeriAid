//
//  HomePageView.swift
//  Periaid
//
//  Created by Padma Priya on 6/23/21.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        TabView {
            LocationView()
                .tabItem {
                    Label("", systemImage: "house")
                }
            
            LocationView()
                .tabItem {
                    Label("", systemImage: "bookmark")
                }

            LocationView()
                .tabItem {
                    Label("", systemImage: "location")
                }
            
            LocationView()
                .tabItem {
                    Label("", systemImage: "gift")
                }
            
            ProfilePageView()
                .tabItem {
                    Label("", systemImage: "person")
                }
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
