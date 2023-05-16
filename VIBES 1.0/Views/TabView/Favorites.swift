//
//  Favorites.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-10.
//

import SwiftUI

struct Favorites: View {
    @EnvironmentObject var cartManager: CartManager
    
    var columns = [GridItem(.adaptive(minimum: 260), spacing: 20)]
    
    var favoriteConcerts: [Concert] {
        return concertsList.filter { concert in
            cartManager.isFavorite(concert: concert)
        }
    }
    
    var body: some View {
            NavigationView {
                if favoriteConcerts.isEmpty {
                    Text("No favorites added")
                        .foregroundColor(.gray)
                        .font(.headline)
                        .padding()
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(favoriteConcerts, id: \.id) { concert in
                                ConcertCard(concert: concert)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("My Favorites")
        }
    }
struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        Favorites()
            .environmentObject(CartManager())
    }
}
