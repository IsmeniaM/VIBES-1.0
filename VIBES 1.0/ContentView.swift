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
            Home()
                .tag(1)
            Search()
                .tag(2)
            Favorites()
                .tag(3)
            Profile()
                .tag(4)
            Settings()
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
