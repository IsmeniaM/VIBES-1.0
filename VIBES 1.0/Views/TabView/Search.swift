//
//  Search.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-10.
//

import SwiftUI

struct Search: View {
    @EnvironmentObject var cartManager: CartManager
    @State private var searchText = ""
    
    var filteredConcerts: [Concert] {
        if searchText.isEmpty {
            return concertsList
        } else {
            return concertsList.filter { concert in
                concert.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
   
    var columns = [GridItem(.adaptive(minimum: 260), spacing: 20)]
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                    .padding()
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(filteredConcerts, id: \.id) { concert in
                            ConcertCard(concert: concert)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle(Text("All Events This Month"))
            .toolbar {
                NavigationLink {
                    CartConcertView()
                        .environmentObject(cartManager)
                } label: {
                    CartConcertButton(numberOfProducts: cartManager.concerts.count)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(cartManager)
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
