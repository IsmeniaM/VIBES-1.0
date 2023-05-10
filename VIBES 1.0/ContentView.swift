//
//  ContentView.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-09.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection = 1
    var body: some View {
        
        TabView(selection: $tabSelection) {
            Text("Home")
                .tag(1)
            Text("Search")
                .tag(2)
            Text("Favorites")
                .tag(3)
            Text("Profile")
                .tag(4)
            Text("Settings")
                .tag(5)
        }
        .overlay(alignment: .bottom) {
            CostumTabView(tabSelection: $tabSelection)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
