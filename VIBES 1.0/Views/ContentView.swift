//
//  ContentView.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-17.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection = 1
    @StateObject var cartManager = CartManager()
    
    var body: some View {
        
        TabView(selection: $tabSelection) {
            Home()
                .environmentObject(cartManager)
                .tag(1)
            Search()
                .environmentObject(cartManager)
                .tag(2)
            Favorites()
                .environmentObject(cartManager)
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
            .preferredColorScheme(.dark)
    }
}
